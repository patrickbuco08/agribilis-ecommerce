<?php

namespace Agribilis\Http\Controllers;

use Agribilis\Mail\OrderConfirmed;
use Agribilis\Mail\OrderDelivered;
use Agribilis\Models\GroupOrder;
use Agribilis\Models\GroupOrderItem;
use Agribilis\Models\GroupOrderItemStatus;
use Agribilis\Models\Status;
use Agribilis\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth']);
    }

    public function getOrders($status)
    {
        $orders = GroupOrder::with(['billingDetails', 'mainStatus', 'items', 'items.product', 'items.status', 'items.status.info'])->where([
            'user_id' => auth()->user()->id
        ]);

        return $orders->get();
    }

    public function index($status = null)
    {
        $status = !$status ?? 'pending';
        return view('buyer.orders', [
            'orders' => $this->getOrders($status)
        ]);
    }

    public function orderSuccess(Request $request)
    {
        if (!$request->session()->has('order')) {
            return redirect()->route('home');
        }
        return view('buyer.order-success');
    }

    public function orderStatus(GroupOrder $order, GroupOrderItem $item)
    {

        if (!$order->ownedBy(auth()->user())) {
            return response(null, 409);
        }

        if (!$order->hasItem($item)) {
            return response(null, 409);
        }

        return view('buyer.order-status', [
            'order' => $order,
            'item' => $item->load(['product', 'status', 'status.info', 'groupOrder', 'product.owner', 'product.owner.info'])
        ]);
    }

    public function orderDetail(Transaction $transaction)
    {
        if (!$transaction->ownedBy(auth()->user())) {
            return response(null, 409);
        }

        $status = Cache::rememberForever('order.status', function () {
            return Status::get();
        });

        $transaction = $transaction->load(['order', 'order.owner', 'order.billingDetails', 'order.items', 'order.items.product', 'order.items.status', 'order.items.status.info']);
        return view('vendor.order-detail', [
            'transaction' => $transaction,
            'status' => $status
        ]);
    }

    // Mail::to(auth()->user())->send(new OrderDelivered());

    public function changeApprovalStatus(Request $request, Transaction $transaction)
    {
        $this->validate($request, [
            'status' => 'required|string'
        ]);

        if (!$transaction->ownedBy(auth()->user())) {
            return response(null, 409);
        }

        try {
            DB::beginTransaction();

            $transaction->order()->update([
                'approval_status' => $request->status,
                'status_id' => $request->status == 'approved' ? 2 : 5
            ]);

            $items = collect($transaction->order->items)->map(function ($item) {
                return $item->id;
            });

            $itemStatus = GroupOrderItemStatus::whereIn('group_order_item_id', $items)->update([
                'status_id' => $request->status == 'approved' ? 2 : 5
            ]);

            if ($request->status == 'approved') {
                $transaction = $transaction->load(['order', 'order.owner', 'order.billingDetails', 'order.items', 'order.items.product']);
                Mail::to($transaction->order->owner->email)->send(new OrderConfirmed($transaction->order));
            }
            DB::commit();
            return back()->with('statusApprovalUpdated', 'yehey!');
        } catch (\Throwable $th) {
            DB::rollback();
            throw $th;
        }
    }

    public function changeStatus(Request $request, Transaction $transaction)
    {
        $this->validate($request, [
            'status' => 'required|integer'
        ]);

        if (!$transaction->ownedBy(auth()->user())) {
            return response(null, 409);
        }

        try {
            DB::beginTransaction();

            $transaction->order()->update([
                'status_id' => $request->status
            ]);

            $items = collect($transaction->order->items)->map(function ($item) {
                return $item->id;
            });

            $itemStatus = GroupOrderItemStatus::whereIn('group_order_item_id', $items)->update([
                'status_id' => $request->status
            ]);

            if ($request->status == 4) {
                $transaction = $transaction->load(['order', 'order.owner', 'order.billingDetails', 'order.items', 'order.items.product']);
                Mail::to($transaction->order->owner->email)->send(new OrderDelivered($transaction->order));
            }

            DB::commit();
            return back()->with('statusUpdated', 'yehey!');
        } catch (\Throwable $th) {
            DB::rollback();
            return $th;
        }
    }

    public function cancelOrder(GroupOrder $order)
    {
        $this->authorize('update', $order);
        $order->update([
            'approval_status' => 'cancelled'
        ]);
        return back();
    }
}
