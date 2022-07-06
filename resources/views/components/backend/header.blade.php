<header class="main-header navbar">

    <div class="col-brand">
        @guest
        <a href="# class=" brand-wrap">
            <img src="{{ asset('frontend/images/logos/agribilis-logo.png') }}" height="46" class="logo"
                alt="AgriBilis Logo">
        </a>
        @endguest
    </div>


    <div class="col-nav">
        <button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside"> <i
                class="md-28 material-icons md-menu"></i> </button>
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link btn-icon" onclick="darkmode(this)" title="Dark mode" href="#"> <i
                        class="material-icons md-nights_stay"></i> </a>
            </li>
            @auth
            <li class="nav-item">
                <a class="nav-link btn-icon" href="#"> <i class="material-icons md-notifications_active"></i> </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"> English </a>
            </li>
            <li class="dropdown nav-item">
                <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#"> <img class="img-xs rounded-circle"
                        src="{{ asset('backend/images/people/avatar1.jpg') }}" alt="User"></a>
                <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="#">My profile</a>
                    <a class="dropdown-item" href="#">Settings</a>
                    <form action="{{ route('logout') }}" method="POST">
                        @csrf
                        <input type="text" name="redirect_vendor" value="dashboard" hidden>
                        <button type="submit" class="dropdown-item text-danger">Logout</button>
                    </form>
                </div>
            </li>
            @endauth
        </ul>
    </div>
</header>
