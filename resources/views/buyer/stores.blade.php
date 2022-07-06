@extends('layouts.frontend.app', ['title' => 'Agribilis Vendors'])

@section('content')
<style>
    .card-user {
        margin-bottom: 20px;
    }

    .card-user .card-header {
        position: relative;
        height: 100px;
        background-color: #FFE5A0;
        text-align: center;
    }

    .card-user .img-avatar {
        position: absolute;
        transform: translate(-50%, -50%);
        border-radius: 100%;
        border: 3px solid #fff;
        top: 100%;
    }

    .card-user .card-body {
        text-align: center;
    }

</style>
<section class="section-main bg padding-y">
    <div class="container">
        <header class="mb-3">
            <div class="form-inline">
                <form action="#" class="search col-lg-4 mr-md-auto">
                    <div class="input-group w-100">
                        <input type="text" class="form-control" style="width: 60%" placeholder="Search..." />
                        <span class="input-group-append">
                            <button class="btn btn-primary" type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </form>
            </div>
        </header>
        <div class="row">
            @forelse ($vendors as $vendor)
            <div class="col-md-3">
                <div class="card card-user">
                    <div class="card-header">
                        <img class="img-md img-avatar" src={{ asset('frontend/images/avatars/'.$vendor->info->photo.'') }}
                            alt="User pic" />
                    </div>
                    <div class="card-body">
                        <h5 class="card-title mt-5">{{ $vendor->full_name }}</h5>
                        <div class="card-text text-muted">
                            <p class="m-0">Phone: {{ $vendor->info->shop_name }}</p>
                            <p>{{ $vendor->email }}</p>
                            <a href="{{ route('vendor', $vendor->full_name) }}" class="btn btn-outline-secondary">View profile</a>
                        </div>
                    </div>
                </div>
            </div>
            @empty
                no vendors
            @endforelse
        </div>
    </div>
</section>
@endsection
