<?php

namespace Agribilis\Http\Controllers;

use Illuminate\Http\Request;
use Agribilis\Models\User;
use Agribilis\Models\Product;

class UserController extends Controller
{
    public function vendors()
    {
        $vendors = User::with(['info', 'role']);

        $vendors->whereHas('role', function ($query) {
            $query->where('role_id', '=', 2);
        });

        // return $vendors->get();

        return view('buyer.stores', [
            'vendors' => $vendors->get()
        ]);
    }

    public function vendor(Request $request, User $user)
    {
        $user->load('info');
        $products = Product::with(['owner', 'owner.info', 'photos', 'reviews'])->where('user_id', '=', $user->id);
        $priceFilter = $request->has('price') && $request->price == "high-to-low" ? 'DESC' : 'ASC';

        $products->orderBy('price', $priceFilter);

        return view('buyer.store', [
            'user' => $user,
            'count' => $products->count(),
            'products' => $products->paginate(12)
        ]);
    }
}
