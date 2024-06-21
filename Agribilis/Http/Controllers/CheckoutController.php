<?php

namespace Agribilis\Http\Controllers;

use Agribilis\Mail\NewOrder;
use Agribilis\Models\GroupOrder;
use Agribilis\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class CheckoutController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth']);
    }

    public function index()
    {
        $items = auth()->user()->cart->load(['product', 'product.owner', 'product.owner.info']);
        $groupedStores = $items->groupBy('product.owner.id');

        // return $groupedStores;

        $total = $items->reduce(function ($total, $item) {
            return $total + $item->price * $item->quantity;
        });

        return view('buyer.checkout', [
            'address' => auth()->user()->address,
            'groupedStores' => $groupedStores,
            'total' => $total,
            'dt' => new Carbon()
        ]);
    }

    public function placeOrder(Request $request)
    {
        $items = auth()->user()->cart->load(['product', 'product.owner', 'product.owner.info']);
        $groupedStores = $items->groupBy('product.owner.id');

        try {
            DB::beginTransaction();

            $dt = new Carbon();
            $billingDetails = auth()->user()->address;

            //loop the store
            foreach ($groupedStores as $store) {

                $tracking_number = '#' . str_pad($store[0]->id + 1, 8, "0", STR_PAD_LEFT);

                $delivery_min = $store->max(function ($item) {
                    return $item->product->delivery_min;
                });
                $delivery_max = $store->max(function ($item) {
                    return $item->product->delivery_max;
                });

                $order = auth()->user()->orders()->create([
                    'tracking_number' => $tracking_number,
                    'mode_of_payment' => 'cash_on_delivery',
                    'approval_status' => 'pending',
                    'status_id' => 1,
                    'delivery_min' => $dt::now()->addDays($delivery_min),
                    'delivery_max' => $dt::now()->addDays($delivery_max),
                    'note_by_owner' => $request->note ?? '',
                    'note_by_vendor' => ''
                ]);

                $order->billingDetails()->create([
                    'full_name' => $billingDetails->full_name,
                    'location' => $billingDetails->location,
                    'phone' => $billingDetails->phone,
                    'postal_code' => $billingDetails->postal_code
                ]);

                foreach ($store as $item) {

                    $orderItem = $order->items()->create([
                        'product_id' => $item->product->id,
                        'amount' => $item->price,
                        'quantity' => $item->quantity
                    ])->status()->create([
                        'status_id' => 1
                    ]);
                }

                //create a transaction for vendor
                Transaction::create([
                    'group_order_id' => $order->id,
                    'user_id' => $item->product->owner->id
                ]);

                $order->load(['billingDetails', 'items', 'items.product']);
                Mail::to($item->product->owner->email)->send(new newOrder($order, $item->product->owner->full_name));
            }

            auth()->user()->cart()->delete();

            DB::commit();
            return redirect()->route('order.success')->with('order', 'Order Successful');
        } catch (\Throwable $th) {
            DB::rollback();
            // echo "ayayay! :(";
            return $th;
            return back();
        }
    }
}
