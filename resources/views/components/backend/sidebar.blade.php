<aside class="navbar-aside" id="offcanvas_aside">
    <div class="aside-top">
        <a href="#" class="brand-wrap">
            <img src="{{ asset('backend/images/logo.svg') }}" height="46" class="logo"
                alt="Ecommerce dashboard template">
        </a>
        <div>
            <button class="btn btn-icon btn-aside-minimize"> <i class="text-muted material-icons md-menu_open"></i>
            </button>
        </div>
    </div> <!-- aside-top.// -->


    <nav>
        <ul class="menu-aside">
            <li class="menu-item {{ request()->is('vendor/dashboard') ? 'active' : '' }}">
                <a class="menu-link" href="{{ route('vendor.dashboard') }}"> <i class="icon material-icons md-home"></i>
                    <span class="text">Dashboard</span>
                </a>
            </li>
            <li class="menu-item {{ request()->is('vendor/product/add') ? 'active' : '' }}">
                <a class="menu-link" href="{{ route('vendor.add-product') }}"> <i
                        class="icon material-icons md-add_box"></i>
                    <span class="text">Add product</span>
                </a>
            </li>
            <li class="menu-item {{ request()->is('vendor/product-list') ? 'active' : '' }}">
                <a class="menu-link" href="{{ route('vendor.product-list') }}"> <i
                        class="icon material-icons md-shopping_bag"></i>
                    <span class="text">My Products</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="#"> <i class="icon material-icons md-shopping_cart"></i>
                    <span class="text">Orders</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="page-reviews.html"> <i class="icon material-icons md-comment"></i>
                    <span class="text">Reviews</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" disabled href="#"> <i class="icon material-icons md-pie_chart"></i>
                    <span class="text">Statistics</span>
                </a>
            </li>
        </ul>
        <hr>
        <ul class="menu-aside">
            <li class="menu-item has-submenu">
                <a class="menu-link" href="#"> <i class="icon material-icons md-settings"></i>
                    <span class="text">Settings</span>
                </a>
                <div class="submenu">
                    <a href="#">Profile</a>
                </div>
            </li>
        </ul>
    </nav>
</aside>
