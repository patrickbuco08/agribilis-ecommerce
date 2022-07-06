@extends('layouts.frontend.app')

@section('content')
<section class="section-content bg padding-y">
    <div class="container">
        <article class="card">
            <header class="card-header"> My Orders / Tracking </header>
            <div class="card-body">
                <h6>Order ID: {{$item->groupOrder->tracking_number}}</h6>
                <article class="card">
                    <div class="card-body row">
                        <div class="col-md-4">
                            <strong>Delivery Estimate time:</strong>
                            <br>{{ $item->created_at->addDays($item->product->delivery_max)->toFormattedDateString() }}
                        </div>
                        <div class="col-md-4">
                            <strong>Shop:</strong> <br> <a href={{ route('vendor', $item->product->owner->full_name) }}>{{ $item->product->owner->info->shop_name }}</a>, | <i
                                class="fa fa-phone"></i>
                            {{ $item->product->owner->info->phone }}
                        </div>
                        <div class="col-md-4">
                            <strong>Status:</strong> <br> {{ $item->status->info->name }}
                        </div>
                    </div>
                </article>

                @if ($item->status->isCancelled() )
                <div class="tracking-wrap">
                    <div class="step active">
                        <span class="icon"> <i class="fa fa-ban"></i> </span>
                        <span class="text">Cancelled</span>
                    </div>
                </div>     
                @else
                <div class="tracking-wrap">
                    <div class="step {{ $item->status->status_id >= 1 ? 'active' : '' }}">
                        <span class="icon"> <i class="fa fa-user"></i> </span>
                        <span class="text"> Pending</span>
                    </div>
                    <div class="step {{ $item->status->status_id >= 2 ? 'active' : '' }}">
                        <span class="icon"> <i class="fa fa-check"></i> </span>
                        <span class="text">Order Confirmed</span>
                    </div>
                    <div class="step {{ $item->status->status_id >= 3 ? 'active' : '' }}">
                        <span class="icon"> <i class="fa fa-truck"></i> </span>
                        <span class="text"> On the way </span>
                    </div>
                    <div class="step {{ $item->status->status_id >= 4 ? 'active' : '' }}">
                        <span class="icon"> <i class="fa fa-box"></i> </span>
                        <span class="text">Delivered</span>
                    </div>
                </div>  
                @endif
                <hr>
                <div class="row">
                    <div class="col-md-3">
                        <figure class="itemside align-items-center">
                            <div class="aside"><img src={{ asset('frontend/images/items/'.$item->product->thumbnail.'') }}
                                    class="img-sm">
                            </div>
                            <figcaption class="info">
                                <a href="#" class="title text-dark">{{ $item->product->name }}</a>
                                <p class="text-muted small">Quantity: {{ $item->quantity }}</p>
                            </figcaption>
                        </figure>
                    </div>
                </div>

                <p>Order Total: ₱{{ number_format($item->totalItemPrice()) }} <br />
                    Payment Method: <strong>Cash on Delivery</strong>
                </p>

                <a href={{ route('user.orders') }} class="btn btn-light"> <i class="fa fa-chevron-left"></i> Back to
                    orders</a>
            </div>
        </article>
    </div>
</section>
@endsection
