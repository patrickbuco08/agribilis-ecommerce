<nav class="navbar navbar-dark navbar-expand p-0 bg-primary">
    <div class="container">
        <ul class="navbar-nav d-none d-md-flex mr-auto">
            <li class="nav-item"><a class="nav-link" href={{ route('home') }}>Home</a></li>
            <li class="nav-item"><a class="nav-link" href={{ route('contact-us') }}>Contact</a></li>
            <li class="nav-item"><a class="nav-link" href={{ route('vendors') }}>Shop</a></li>
            <li class="nav-item"><a class="nav-link" href={{ route('about-us') }}>About Us</a></li>
        </ul>
        <ul class="navbar-nav">
            <li class="nav-item"><a href="{{ route('vendor.register') }}" target="_blank" class="nav-link"> Become a Vendor </a></li>
            @auth
            <li class="nav-item widget dropdown d-inline-block">
                <a href="#" class="nav-link mr-4 dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img class="icon icon-xs rounded-circle" style="width: 20px; height: 20px"
                        src={{ asset('frontend/images/avatars/avatar2.jpg') }}>
                    {{ auth()->user()->full_name }}
                </a> <!-- iconbox // -->
                <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-end"
                    style="position: absolute; transform: translate3d(0px, 32px, 0px); top: 0px; left: 0px; will-change: transform;">
                    @if (auth()->user()->isVendor())
                    <a class="dropdown-item" href={{ route('vendor.dashboard') }}>Dashboard</a>
                    @else
                    <a class="dropdown-item" href={{ route('user.overview') }}>Profile Setting</a>
                    <a class="dropdown-item" href={{ route('user.orders') }}>My Orders</a>
                    @endif

                    <div class="dropdown-divider"></div>
                    <form action={{ route('logout') }} method="POST">
                        @csrf
                        <button type="submit" class="dropdown-item">Logout</button>
                    </form>
                </div>
            </li>
            @endauth
            @guest
            <li class="nav-item"><a href={{ route('register') }} class="nav-link"> Sign Up</a></li>
            <li class="nav-item"><a href={{ route('login') }} class="nav-link"> Login </a></li>
            @endguest
        </ul>
    </div>
    </div>
</nav>

<section class="header-main border-bottom">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-2 col-6">
                <a class="navbar-brand" href="#"><img src={{ asset('frontend/images/logos/agribilis-logo.png') }}
                        class="logo"></a>
            </div>
            <div class="col-lg-8 col-12 col-sm-12">
                <form action="{{ route('search.products', [
                    'search' => request()->get('search'),
                    'price' => "low-to-high"
                ]) }}" method="GET" class="form-inline flex-grow-1 mr-auto my-2 my-lg-0">
                    <div class="input-group w-100">
                        @if (request()->get('price'))
                        <input type="text" name="price" value="{{request()->get('price')}}" hidden />
                        @endif
                        <input type="text" class="form-control" name="search" placeholder="What are you looking for?"
                            value="{{request()->get('search')}}">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-success">
                                <i class="fa fa-search"></i> Search
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-2 col-sm-6 col-12">
                @auth
                <div class="widgets-wrap float-lg-right">
                    <div class="widget-header  mr-3">
                        <a href={{ route('user.cart') }} class="icon icon-sm rounded-circle border"><i class="fa fa-shopping-cart"></i></a>
                        @guest
                        <span class="badge badge-pill badge-danger notify">0</span>
                        @endguest
                        @auth
                        <span class="badge badge-pill badge-danger notify"
                            id="cart-count">{{ auth()->user()->cartCount() ?? 0 }}</span>
                        @endauth
                    </div>
                </div>
                @endauth
            </div>
        </div>
    </div>
</section>

<nav class="navbar navbar-main navbar-expand-lg navbar-light border-bottom">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav"
            aria-controls="main_nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="main_nav">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link pl-0" data-toggle="dropdown" href="#"><strong> <i class="fa fa-bars"></i> &nbsp
                            All category</strong></a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href={{ route('search.products',[
                            'mainCategory' => 'crops'
                        ]) }}>Crops</a>
                        <a class="dropdown-item" href={{ route('search.products',[
                            'mainCategory' => 'livestock'
                        ]) }}>Livestock</a>
                        <a class="dropdown-item" href={{ route('search.products',[
                            'mainCategory' => 'poultry'
                        ]) }}>Poultry</a>
                        <a class="dropdown-item" href={{ route('search.products',[
                            'mainCategory' => 'fisheries'
                        ]) }}>Fisheries</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href={{ route('search.products',[
                            'mainCategory' => 'crops'
                        ]) }}>Crops</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href={{ route('search.products',[
                            'mainCategory' => 'livestock'
                        ]) }}>Livestock</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href={{ route('search.products',[
                            'mainCategory' => 'poultry'
                        ]) }}>Poultry</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href={{ route('search.products',[
                            'mainCategory' => 'fisheries'
                        ]) }}>Fisheries</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
