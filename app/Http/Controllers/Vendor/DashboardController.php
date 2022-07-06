<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function __construct(){
        $this->middleware(['auth', 'vendor', 'verified']);
    }

    public function index()
    {
        $transactions = auth()->user()->transactions->load(['order', 'order.owner', 'order.billingDetails', 'order.items', 'order.items.product', 'order.items.status']);
        return view('vendor.dashboard',[
            'transactions' => $transactions
        ]);
    }
}


