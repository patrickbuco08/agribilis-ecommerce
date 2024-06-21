<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CartController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth']);
    }

    public function index()
    {
        $cartItems = auth()->user()->cart->load(['owner', 'product']);

        $total = $cartItems->reduce(function ($total, $item) {
            return $total + $item->price * $item->quantity;
        });

        return view('buyer.cart', [
            'cartItems' => $cartItems,
            'total' => $total
        ]);
    }

    public function store(Request $request, Product $product)
    {
        if ($request->user()->cannot('create', Cart::class)) {
            return response()->json("Your account is not allowed to buy products", 401); //Unauthorized
        }

        $validator = Validator::make($request->all(), [
            'productQuantity' => 'required|integer',
        ]);

        //400 -> Bad Request
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $cart = Cart::where(['user_id' => auth()->user()->id, 'product_id' => $product->id])->first();

        if ($cart == null) {
            $cart = Cart::create([
                'user_id' => auth()->user()->id,
                'product_id' => $product->id,
                'price' => $product->price,
                'quantity' => $request->productQuantity
            ]);
        } else {
            $cart->update([
                'quantity' => $cart->quantity + $request->productQuantity
            ]);
        }

        $cartCount = auth()->user()->cart->reduce(function ($total, $cart) {
            return $total + $cart->quantity;
        });

        return response()->json(['cartCount' => $cartCount], 200);
    }

    //to check if the cart contains specific product
    private function cartHasThisItem($product)
    {
        $cart = Cart::where(['user_id' => auth()->user()->id, 'product_id' => $product->id])->first();
        return $cart != null ? true : false;
    }

    public function buyNow(Product $product, Request $request)
    {
        if ($request->user()->cannot('create', Cart::class)) {
            return response()->json("Your account is not allowed to buy products", 401); //Unauthorized
        }

        $validator = Validator::make($request->all(), [
            'productQuantity' => 'required|integer',
        ]);

        //400 -> Bad Request
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        //kapag ang user ay hindi pa naiaadd to cart ang item, then create that shit
        if (!$this->cartHasThisItem($product)) {
            $cart = Cart::create([
                'user_id' => auth()->user()->id,
                'product_id' => $product->id,
                'price' => $product->price,
                'quantity' => $request->productQuantity
            ]);
        }

        return response()->json(null, 200);
    }

    public function updateQuantity(Cart $cart, Request $request)
    {
        $validator = Validator::make($request->all(), [
            'productQuantity' => 'required|integer|min:1',
        ]);

        //400 -> Bad Request
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        if (!$cart->ownedBy(auth()->user())) {
            return response()->json(null, 409);
        }

        $cart->update([
            'quantity' => $request->productQuantity
        ]);

        $cartCount = auth()->user()->cart->reduce(function ($total, $cart) {
            return $total + $cart->quantity;
        });
        $itemQuantity = $cart->quantity;

        return response()->json([
            'cartCount' => $cartCount,
            'itemQuantity' => $itemQuantity
        ], 200);
    }

    public function destroy(Cart $cart)
    {

        if (!$cart->ownedBy(auth()->user())) {
            return response(null, 409);
        }

        $cart->delete();
        return back();
    }
}
