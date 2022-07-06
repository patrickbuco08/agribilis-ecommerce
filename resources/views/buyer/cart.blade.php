@extends('layouts.frontend.app', ['title' => 'Shopping Cart'])

@section('content')

<section class="section-content bg padding-y h-82vh">
    <div class="container">

        @if (!$cartItems->isEmpty())
        <div class="row">
            <aside class="col-lg-9">
                <div class="card">
                    <table class="table table-borderless table-shopping-cart">
                        <thead class="text-muted">
                            <tr class="small text-uppercase">
                                <th scope="col">Product</th>
                                <th scope="col" width="120">Quantity</th>
                                <th scope="col" width="120">Price</th>
                                <th scope="col" class="text-right"> </th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($cartItems as $cartItem)
                            <tr>
                                <td>
                                    <figure class="itemside align-items-center">
                                        <div class="aside"><img
                                                src="{{ asset('frontend/images/items/'.$cartItem->product->thumbnail.'') }}"
                                                class="img-sm"></div>
                                        <figcaption class="info">
                                            <a href={{ route('product', $cartItem->product->string_id) }} class="title text-dark">{{ $cartItem->product->name }}</a>
                                            <p class="text-muted small">Seller: <a href={{ route('vendor', $cartItem->product->owner->full_name) }}>{{ $cartItem->product->owner->full_name }}</a></p>
                                        </figcaption>
                                    </figure>
                                </td>
                                <td>
                                    <div class="input-group input-spinner">
                                        <div class="input-group-prepend cart-modify-quantity">
                                            <button class="btn btn-light" type="button" data-id={{$cartItem->id}}
                                                id="button-minus"> <i class="fa fa-minus"></i> </button>
                                        </div>
                                        <input type="text" class="form-control"
                                            name="product-quantity[{{$cartItem->id}}]"
                                            value="{{ $cartItem->quantity }}">
                                        <div class="input-group-append cart-modify-quantity">
                                            <button class="btn btn-light" type="button" data-id={{$cartItem->id}}
                                                id="button-plus"> <i class="fa fa-plus"></i> </button>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="price-wrap">
                                        <var
                                            class="price number-separator">₱{{ number_format($cartItem->totalPriceOfItem()) }}</var>
                                        <small class="text-muted"> ₱{{ number_format($cartItem->price) }} each </small>
                                    </div>
                                </td>
                                <td class="text-right">
                                    <form action={{ route('user.cart.destroy', $cartItem->id) }} method="POST">
                                        @method('delete')
                                        @csrf
                                        <button type="submit" class="btn btn-light"> Remove</button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <div class="card-body border-top">
                        <a href={{ route('user.checkout') }} class="btn btn-primary float-md-right"> Make Purchase <i
                                class="fa fa-chevron-right"></i> </a>
                        <a href="#" class="btn btn-light"> <i class="fa fa-chevron-left"></i> Continue shopping </a>
                    </div>

                </div>

            </aside>
            <aside class="col-lg-3">

                <div class="card">
                    <div class="card-body">
                        <dl class="dlist-align">
                            <dt>Total price:</dt>
                            <dd class="text-right">₱{{ number_format($total) }}</dd>
                        </dl>
                        <dl class="dlist-align">
                            <dt>Discount:</dt>
                            <dd class="text-right text-success">₱0.00</dd>
                        </dl>
                        <dl class="dlist-align">
                            <dt>Total:</dt>
                            <dd class="text-right text-dark b"><strong>₱{{ number_format($total) }}</strong></dd>
                        </dl>
                    </div>
                </div>

            </aside>


        </div>
        @else
        <div class="row">
            <div class="col-lg-12 d-flex flex-column align-items-center center-xy">
                <x-svg.empty-cart />
                <p class="text-muted mt-3">There are no items in this cart</p>
                <a href={{ route('search.products') }} class="btn btn-outline-primary">Shop Now</a>
            </div>
        </div>
        @endif

    </div>
</section>
@endsection
