@extends('layouts.frontend.app')

@section('content')
<section class="section-intro padding-y-sm">
    <div class="container">
        <div class="intro-banner-wrap">
            <img src={{ asset('frontend/images/banners/agribilis-banner.jpg') }} class="w-100 rounded">
        </div>
    </div>
</section>

<!-- features products -->
<section class="section-name  padding-y-sm">
    <div class="container">
        <header class="section-heading">
            <h3 class="section-title text-center">Our Featured Products</h3>
        </header>
        <div class="row">
            <div class="col-md-3 col-6 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{  asset('frontend/images/items/coffee-arabica.png') }}>
                    </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Coffee Arabica</a>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/coffee-liberica.png') }}>
                    </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Coffee Liberica</a>
                        <div class="price mt-1">₱280.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/cassava-flour.png') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Cassava Flour</a>
                        <div class="price mt-1">₱56.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/tobacco.png') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Tobacco</a>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/tomato-catsup.png') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Tomato Catsup</a>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/product-9.png') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Tinolang Kambiing</a>
                        <div class="price mt-1">₱280.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/coconut-milk.png') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Coconut Milk</a>
                        <div class="price mt-1">₱56.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/copa.png') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Copa</a>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- popular products -->
<section class="section-name padding-y-sm">
    <div class="container">

        <header class="section-heading">
            <a href="#" class="btn btn-outline-primary float-right">See all</a>
            <h3 class="section-title">Popular products</h3>
        </header>

        <div class="row">
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/1.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Just another product name</a>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/2.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Some item name here</a>
                        <div class="price mt-1">₱280.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/3.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Great product name here</a>
                        <div class="price mt-1">₱56.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/4.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Just another product name</a>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/5.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Just another product name</a>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/6.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Some item name here</a>
                        <div class="price mt-1">₱280.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/7.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Great product name here</a>
                        <div class="price mt-1">₱56.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/8.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Just another product name</a>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
        </div>

    </div>
</section>

<!-- new arrived -->
<section class="section-content">
    <div class="container">

        <header class="section-heading">
            <h3 class="section-title">New arrived</h3>
        </header>

        <div class="row">
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/5.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Just another product name</a>

                        <div class="rating-wrap">
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <span class="label-rating text-muted"> 34 reviws</span>
                        </div>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/6.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Some item name here</a>

                        <div class="rating-wrap">
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <span class="label-rating text-muted"> 34 reviws</span>
                        </div>
                        <div class="price mt-1">₱280.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/7.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Great product name here</a>

                        <div class="rating-wrap">
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <span class="label-rating text-muted"> 34 reviws</span>
                        </div>
                        <div class="price mt-1">₱56.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/9.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Just another product name</a>

                        <div class="rating-wrap">
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <span class="label-rating text-muted"> 34 reviws</span>
                        </div>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
        </div>

    </div>
</section>

<!-- recommended -->

<section class="section-content padding-bottom-sm">
    <div class="container">

        <header class="section-heading">
            <a href="#" class="btn btn-outline-primary float-right">See all</a>
            <h3 class="section-title">Recommended</h3>
        </header>

        <div class="row">
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/5.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Just another product name</a>

                        <div class="rating-wrap">
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <span class="label-rating text-muted"> 34 reviws</span>
                        </div>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/6.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Some item name here</a>

                        <div class="rating-wrap">
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <span class="label-rating text-muted"> 34 reviws</span>
                        </div>
                        <div class="price mt-1">₱280.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/7.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Great product name here</a>

                        <div class="rating-wrap">
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <span class="label-rating text-muted"> 34 reviws</span>
                        </div>
                        <div class="price mt-1">₱56.00</div>
                    </figcaption>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div href="#" class="card card-product-grid">
                    <a href="#" class="img-wrap"> <img src={{ asset('frontend/images/items/9.jpg') }}> </a>
                    <figcaption class="info-wrap">
                        <a href="#" class="title">Just another product name</a>

                        <div class="rating-wrap">
                            <ul class="rating-stars">
                                <li style="width:80%" class="stars-active">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                                <li>
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i>
                                </li>
                            </ul>
                            <span class="label-rating text-muted"> 34 reviws</span>
                        </div>
                        <div class="price mt-1">₱179.00</div>
                    </figcaption>
                </div>
            </div>
        </div>

    </div>
</section>
@endsection
