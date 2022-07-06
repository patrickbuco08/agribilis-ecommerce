@extends('layouts.backend.app', ['title' => 'Admin Dashboard'])

@section('content')
<section class="content-main">
    {{-- fuck --}}
    <div class="content-header">
        <h2 class="content-title"> Dashboard </h2>
        <div>
            <a href="#" class="btn btn-primary">Create report</a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <div class="card card-body mb-4">
                <article class="icontext">
                    <span class="icon icon-sm rounded-circle bg-primary-light"><i
                            class="text-primary material-icons md-monetization_on"></i></span>
                    <div class="text">
                        <h6 class="mb-1">Total Sales</h6> <span>$00.00</span>
                    </div>
                </article>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card card-body mb-4">
                <article class="icontext">
                    <span class="icon icon-sm rounded-circle bg-success-light"><i
                            class="text-success material-icons md-local_shipping"></i></span>
                    <div class="text">
                        <h6 class="mb-1">Total Orders</h6>
                        <span>{{number_format(auth()->user()->transactions->count())}}</span>
                    </div>
                </article>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card card-body mb-4">
                <article class="icontext">
                    <span class="icon icon-sm rounded-circle bg-warning-light"><i
                            class="text-warning material-icons md-shopping_basket"></i></span>
                    <div class="text">
                        <h6 class="mb-1">Total Products</h6>
                        <span>{{number_format(auth()->user()->products->count())}}</span>
                    </div>
                </article>
            </div>
        </div>
    </div>


    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">Latest orders</h5>
            <div class="table-responsive">
                <table class="table table-hover">
                    @foreach ($transactions as $transaction)
                    <tr>
                        <td>{{ $transaction->order->tracking_number }}</td>
                        <td><b>{{$transaction->order->owner->full_name}}</b></td>
                        <td>{{$transaction->order->owner->email}}</td>
                        <td>₱{{ number_format($transaction->order->subTotal()) }}</td>
                        <td>
                            @switch($transaction->order->approval_status)
                            @case('pending')
                            <span class="text-info">For Approval</span>
                            @break
                            @case('cancelled')
                            <span class="text-danger">Cancelled</span>
                            @break
                            @default
                            @switch($transaction->order->status_id)
                            @case(1)
                            <span class="text-warning">Pending</span>
                            @break
                            @case(2)
                            <span class="text-success">Order Confirmed</span>
                            @break
                            @case(3)
                            <span class="text-success">On The Way</span>
                            @break
                            @case(4)
                            <span class="text-success">Delivered</span>
                            @break
                            @default
                            <span class="text-info">Unknown</span>
                            @endswitch
                            @endswitch
                        </td>
                        <td>{{ $transaction->created_at->diffForHumans() }}</td>
                        <td class="text-end">
                            <a href="{{ route('vendor.order.detail', $transaction->id) }}"
                                class="btn btn-light">Detail</a>
                        </td>
                    </tr>
                    @endforeach
                </table>
            </div>
        </div>
    </div>

</section>
@endsection
