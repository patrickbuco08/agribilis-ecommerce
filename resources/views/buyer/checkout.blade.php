@extends('layouts.frontend.app', ['title' => 'Checkout'])

@section('title', 'Checkout')

@section('content')
<section class="section-content padding-y bg">
    <div class="container">

        <div class="row">
            <main class="col-md-8">

                <article class="card mb-4">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-md-10">
                                <h6 class="card-title"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                    {{ $address ? 'Delivery Address' : 'No Delivery Address' }}</h6>
                                @if ($address)
                                <p>{{ $address->full_name }} <br />
                                    Phone {{ $address->phone }} <br />
                                    Location: {{ $address->location }} <br />
                                    Postal Code: {{ $address->postal_code }} <br />
                                </p>
                                @endif
                            </div>
                            <div class="col-md-2">
                                <a href={{ route('user.address') }}
                                    class="btn btn-light">{{ $address ? 'Change' : 'Add Address' }}</a>
                            </div>
                        </div>
                    </div>
                </article>

                @foreach ($groupedStores as $groupedStore)
                <article class="card mb-4">
                    <article class="card-body">
                        <header class="mb-4">
                            <div class="icontext align-items-start mr-4" style="max-width: 300px;">
                                <img class="icon icon-xs rounded-circle" style="width: 20px; height: 20px"
                                    src={{ asset('frontend/images/avatars/'.$groupedStore->first()->product->owner->info->photo.'') }}>
                                <div class="text">
                                    <h6 class="title"><a
                                            href="#">{{ $groupedStore->first()->product->owner->info->shop_name }}</a>
                                    </h6>
                                </div>
                            </div>
                        </header>
                        <div class="row">
                            @foreach ($groupedStore as $item)
                            <div class="col-md-6">
                                <figure class="itemside  mb-3">
                                    <div class="aside"><img
                                            src={{ asset('frontend/images/items/'.$item->product->thumbnail.'') }}
                                            class="border img-xs"></div>
                                    <figcaption class="info">
                                        <p>{{ $item->product->name }}</p>
                                        <span>{{ $item->quantity }} x ₱{{ $item->price }} = Total:
                                            <b>${{ number_format($item->totalPriceOfItem()) }}</b> </span>
                                    </figcaption>
                                </figure>
                            </div>
                            @endforeach

                            @php
                            $delivery_min = $groupedStore->max(function($item){
                            return $item->product->delivery_min;
                            });

                            $delivery_max = $groupedStore->max(function($item){
                            return $item->product->delivery_max;
                            });

                            $itemSubTotal = $groupedStore->reduce(function($total, $item){
                            return $total + $item->quantity;
                            });

                            $subTotal = $groupedStore->reduce(function ($total, $item) {
                            return $total + $item->price*$item->quantity;
                            });

                            @endphp
                            <div class="col-md-12">
                                <p><i class="fa fa-truck" aria-hidden="true"></i> Est. Arrival:
                                    @if ($dt::now()->addDays($delivery_min)->format('m') ==
                                    $dt::now()->addDays($delivery_max)->format('m'))
                                    {{$dt::now()->addDays($delivery_min)->format('d')}}-{{$dt::now()->addDays($delivery_max)->format('d F Y')}}
                                    @else
                                    {{$dt::now()->addDays($delivery_min)->format('d F')}}-{{$dt::now()->addDays($delivery_max)->format('d F Y')}}
                                    @endif
                                    <br />
                                    {{ $itemSubTotal }} {{ Str::plural('item', $itemSubTotal) }}, Subtotal:
                                    <b>₱{{ number_format($subTotal) }}</b>
                                </p>
                            </div>
                        </div>
                    </article>
                </article>
                @endforeach
            </main>

            <aside class="col-md-4">
                <div class="card shadow">
                    <div class="card-body">
                        <h4 class="mb-3">Overview</h4>
                        <dl class="dlist-align">
                            <dt class="text-muted">Subtotal:</dt>
                            <dd>₱{{ number_format($total) }}</dd>
                        </dl>
                        <dl class="dlist-align">
                            <dt class="text-muted">Shipping Total:</dt>
                            <dd>₱0.00</dd>
                        </dl>
                        <dl class="dlist-align">
                            <dt class="text-muted">Payment method:</dt>
                            <dd><b>Cash on Delivery</b></dd>
                        </dl>
                        <hr>
                        <dl class="dlist-align">
                            <dt>Total:</dt>
                            <dd class="h5">₱{{ number_format($total) }}</dd>
                        </dl>
                        <hr>
                        @if ($address)
                        <form action="{{ route('place-order') }}" method="POST">
                            @csrf
                            <div class="form-group">
                                <textarea class="form-control" name="note" placeholder="Leave some note to the vendor (optional)" rows="2"></textarea>
                            </div>
                            <button type="submit" class="btn btn-success btn-block"> Place Order </button>
                        </form>
                        @endif
                    </div>
                </div>
            </aside>
        </div>

    </div>
</section>
@endsection
