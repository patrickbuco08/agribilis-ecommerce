@extends('layouts.frontend.app', ['title' => $product->name." | Agribilis Philippines"])

@section('content')
<section class="section-content bg-white padding-y">
    <div class="container">
        <div class="row">
            <aside class="col-md-6">
                <div class="card">
                    <article class="gallery-wrap">
                        <div class="img-big-wrap">
                            <span href="#"><img src={{ asset('frontend/images/items/'.$product->thumbnail.'') }}
                                    id="main-thumbnail" /></span>
                        </div>
                        <div class="thumbs-wrap">
                            @foreach ($product->photos as $photo)
                            <span href="#" class="item-thumb" data-photo={{ $photo->name }}> <img
                                    src={{ asset('frontend/images/items/'.$photo->name.'') }} /></span>
                            @endforeach
                        </div>
                    </article>
                </div>
            </aside>
            <main class="col-md-6">
                <article class="product-info-aside">

                    <h2 class="title mt-3">{{ $product->name }}</h2>

                    <div class="rating-wrap my-3">
                        <ul class="rating-stars">
                            <li style="width:{{ $product->rating }}%" class="stars-active">
                                <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </li>
                            <li>
                                <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </li>
                        </ul>
                        <small class="label-rating text-muted">{{ $product->reviews->count() }}
                            {{ Str::plural('review', $product->reviews->count()) }}</small>
                        <small class="label-rating text-success"> <i class="fa fa-clipboard-check"></i>
                            {{ $product->orders }} {{ Str::plural('order', $product->orders) }}
                        </small>
                    </div>

                    <div class="mb-3">
                        <var class="price h4">₱{{ $product->price }}</var>
                        <span class="text-muted">/per {{ $product->unit }}</span>
                    </div>

                    <p>{{ $product->description }}</p>


                    <dl class="row">
                        <dt class="col-sm-3">Shop</dt>
                        <dd class="col-sm-9"><a href={{ route('vendor', $product->owner->full_name) }}>{{ $product->owner->info->shop_name }}</a></dd>

                        <dt class="col-sm-3">Location</dt>
                        <dd class="col-sm-9">{{ $product->owner->info->location }}</dd>
                    </dl>

                    <div class="form-row  mt-4">
                        <div class="form-group col-md flex-grow-0">
                            <div class="input-group mb-3 input-spinner">
                                <div class="input-group-prepend product-modify-quantity">
                                    <button class="btn btn-light" type="button" id="button-plus"> + </button>
                                </div>
                                <input type="text" class="form-control" value="1" name="product-quantity">
                                <div class="input-group-append product-modify-quantity">
                                    <button class="btn btn-light" type="button" id="button-minus"> &minus; </button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md">
                            @auth
                                @if ($product->stock)
                                <button type="submit" class="btn btn-success" id="buy-now"
                                data-product-id={{$product->string_id}}><i class="fas fa-envelope"></i> <span
                                    class="text">Buy
                                    Now</span></button>
    
                                <button type="submit" class="btn btn-outline-success"
                                data-product-id={{$product->string_id}} id="add-to-cart"><i
                                    class="fas fa-shopping-cart"></i> <span class="text">Add to cart</span></button>
                                @else
                                <button class="btn btn-outline-warning" disabled>
                                    <i class="fas fa-shopping-cart"></i> Out of Stock
                                </button>
                                @endif
                            @endauth

                            @guest
                                @if ($product->stock)
                                <a class="btn btn-outline-success" href="{{ route('login') }}">
                                    <i class="fas fa-shopping-cart"></i> <span class="text">Add to cart</span>
                                </a>
                                @else
                                <button class="btn btn-outline-warning" disabled>
                                    <i class="fas fa-shopping-cart"></i> Out of Stock
                                </button>
                                @endif
                            @endguest
                        </div>
                    </div>

                </article>
            </main>
        </div>

    </div>
</section>

<section class="section-name padding-y bg">
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <h5 class="title-description">Description</h5>
                <p>{{ $product->description }}</p>

            </div>

            {{-- <aside class="col-md-4">

                <div class="box">

                    <h5 class="title-description">Related Products</h5>
                    <p>{{ $product->description }}</p>

                    <h5 class="title-description">Videos</h5>


                    <article class="media mb-3">
                        <a href="#"><img class="img-sm mr-3" src={{route('product.image', '1.jpg')}}></a>
                        <div class="media-body">
                            <h6 class="mt-0"><a href="#">How to use this item</a></h6>
                            <p class="mb-2"> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque
                                ante
                                sollicitudin </p>
                        </div>
                    </article>

                    <article class="media mb-3">
                        <a href="#"><img class="img-sm mr-3" src={{route('product.image', '4.jpg')}}></a>
                        <div class="media-body">
                            <h6 class="mt-0"><a href="#">New tips and tricks</a></h6>
                            <p class="mb-2"> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque
                                ante
                                sollicitudin </p>
                        </div>
                    </article>

                    <article class="media mb-3">
                        <a href="#"><img class="img-sm mr-3" src={{route('product.image', '2.jpg')}}></a>
                        <div class="media-body">
                            <h6 class="mt-0"><a href="#">New tips and tricks</a></h6>
                            <p class="mb-2"> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque
                                ante
                                sollicitudin </p>
                        </div>
                    </article>



                </div>
            </aside> --}}
        </div>

    </div>
</section>

@endsection
