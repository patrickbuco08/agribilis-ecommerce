<aside class="col-md-3 mb-3">
    <ul class="list-group">
        <a class="list-group-item {{ request()->is('user/overview') ? 'active' : '' }}" href="{{ !request()->is('user/overview') ? route('user.overview') : '#' }}"> Overview</a>
        <a class="list-group-item {{ request()->is('user/orders') ? 'active' : '' }}" href="{{ !request()->is('user/orders') ? route('user.orders') : '#' }}"> Transactions</a>
        {{-- <a class="list-group-item {{ request()->is('user/orders/completed') ? 'active' : '' }}" href="{{ !request()->is('user/orders/completed') ? route('user.orders', ['status' => 'completed']) : '#' }}"> My Order History</a> --}}
        <a class="list-group-item" href="#"> Received Orders </a>
        <a class="list-group-item {{ request()->is('user/address') ? 'active' : '' }}" href="{{ !request()->is('user/address') ? route('user.address') : '#' }}"> My Address</a>
    </ul>
    <br>
    <form action={{ route('logout') }} method="POST">
        @csrf
        <button type="submit" class="btn btn-light btn-block"> <i class="fa fa-power-off"></i> <span class="text">Log out</span> </button>
    </form>
</aside>