<div class="col-md-{{$size}} col-6">

    <figure class="card card-product-grid">

        <a href={{ route('product', $product->string_id) }} class="img-wrap">
            <span class="badge badge-danger"> NEW </span>
            <img src={{ asset('frontend/images/items/'.$product->thumbnail.'') }} alt="agribilis product" />
        </a>

        <figcaption class="info-wrap">
            <p class="title mb-2">{{ $product->name }}</p>
            <div class="price-wrap">
                <span class="price">₱{{ $product->price }}</span>
                <small class="text-muted">/{{ $product->unit }}</small>
            </div>

            <div class="rating-wrap my">
                <ul class="rating-stars">
                    <li style="width: {{$product->rating}}%" class="stars-active">
                        <img src={{ asset('frontend/images/icons/stars-active.svg') }} alt="active star rating" />
                    </li>
                    <li>
                        <img src={{ asset('frontend/images/icons/starts-disable.svg') }} alt="disabled star rating" />
                    </li>
                </ul>
            </div>

            <p class="text-muted "><a href={{ route('vendor', $product->owner->full_name) }}>{{ $product->owner->full_name }}</a></p>
            <hr>

            <p class="mb-3">
                <span class="tag"> <i class="fa fa-check"></i> Verified</span>
                <span class="tag"> {{$product->stock}} stock </span>
                <span class="tag"> {{$product->orders}} {{ Str::plural('order', $product->orders) }} </span>
            </p>

            <div class="text-center">
                @auth
                    @if ($product->stock)
                    <button class="btn btn-outline-success" data-product-id={{$product->string_id}} id="add-to-cart">
                        <i class="fas fa-shopping-cart"></i> <span class="text">Add to cart</span>
                    </button>
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

        </figcaption>
    </figure>

</div>
