@extends('layouts.frontend.app', ['title' => 'My Orders'])

@section('content')
<section class="section-content bg padding-y">
    <div class="container">
        <div class="row">
            <x-frontend.user-setting />
            <div class="col-md-9">
                @if ($orders->count())
                    @foreach ($orders as $order)
                    <x-order-card :order="$order" />
                    @endforeach
                @else
                    <div class="alert alert-info" role="alert">
                        <h4 class="alert-heading">{{ request()->is('user/orders') ? 'No Orders Yet' : 'No Completed Orders Yet' }}</h4>
                        <p><a class="btn btn-info" href="{{ route('search.products') }}">Shop Now!</a></p>
                      </div>
                @endif
            </div>
        </div>
    </div>
</section>
@endsection
