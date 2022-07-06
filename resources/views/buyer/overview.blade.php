@extends('layouts.frontend.app', ['title' => 'Overview'])

@section('content')
<section class="section-content padding-y">
    <div class="container">

        <div class="row">
            <x-frontend.user-setting />
            <main class="col-md-9">
                <article class="card mb-3">
                    <div class="card-body">

                        <figure class="icontext">
                            <div class="icon">
                                <img class="rounded-circle img-sm border"
                                    src={{ asset('frontend/images/avatars/avatar3.jpg') }} alt="avatar" />
                            </div>
                            <div class="text">
                                <strong> {{ auth()->user()->full_name }} </strong> <br>
                                {{ auth()->user()->email }} <br>
                                <a href="#">Edit</a>
                            </div>
                        </figure>
                        <hr>

                        <article class="card-group">
                            <figure class="card bg">
                                <div class="p-3">
                                    <h5 class="card-title">{{ $pendingOrders }}</h5>
                                    <span>Pending Orders</span>
                                </div>
                            </figure>
                            <figure class="card bg">
                                <div class="p-3">
                                    <h5 class="card-title">{{ $confirmedOrders }}</h5>
                                    <span>Confirmed Orders</span>
                                </div>
                            </figure>
                            <figure class="card bg">
                                <div class="p-3">
                                    <h5 class="card-title">{{ $onTheWayOrders }}</h5>
                                    <span>Awaiting delivery</span>
                                </div>
                            </figure>
                            <figure class="card bg">
                                <div class="p-3">
                                    <h5 class="card-title">{{ $deliveredOrders }}</h5>
                                    <span>Delivered items</span>
                                </div>
                            </figure>
                        </article>

                    </div>
                </article>

                <article class="card  mb-3">
                    <div class="card-body">
                        <h5 class="card-title mb-4">Recent orders </h5>

                        <div class="row">
                            @foreach ($recentOrders as $order)
                            <div class="col-md-6">
                                <figure class="itemside  mb-3">
                                    <div class="aside"><img src={{ asset('frontend/images/items/'.$order->product->thumbnail.'') }}
                                            class="border img-sm" alt="agribilis item" /></div>
                                    <figcaption class="info">
                                        {{-- <time class="text-muted"><i class="fa fa-calendar-alt"></i>
                                        12.09.2019</time> --}}
                                        <p>{{ $order->product->name }} </p>
                                        <span class="text-warning">{{ $order->status->info->name }}</span>
                                    </figcaption>
                                </figure>
                            </div>
                            @endforeach
                        </div>

                        <a href="#" class="btn btn-outline-primary"> See all orders </a>
                    </div>
                </article>

            </main>
        </div>

    </div>
</section>
@endsection
