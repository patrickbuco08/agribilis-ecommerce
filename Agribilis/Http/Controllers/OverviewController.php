<?php

namespace Agribilis\Http\Controllers;

use Illuminate\Http\Request;

class OverviewController extends Controller
{

    public function __construct()
    {
        $this->middleware(['auth']);
    }

    public function index()
    {
        $items = auth()->user()->orderItems();
        $pendingOrders = $items->where('status.status_id', 1)->count();
        $confirmedOrders = $items->where('status.status_id', 2)->count();
        $onTheWayOrders = $items->where('status.status_id', 3)->count();
        $deliveredOrders = $items->where('status.status_id', 4)->count();
        $cancelledOrders = $items->where('status.status_id', 5)->count();

        return view('buyer.overview', [
            'recentOrders' => $items,
            'pendingOrders' => $pendingOrders,
            'confirmedOrders' => $confirmedOrders,
            'onTheWayOrders' => $onTheWayOrders,
            'deliveredOrders' => $deliveredOrders,
            'cancelledOrders' => $cancelledOrders
        ]);
    }
}
