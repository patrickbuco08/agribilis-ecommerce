@extends('layouts.backend.app')

@section('content')
<section class="content-main">

    <div class="content-header">
        <h2 class="content-title">Products list </h2>
        <div>
            <a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Create new</a>
        </div>
    </div>

    <div class="card mb-4">
        <header class="card-header">
            <div class="row align-items-center">

                <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
                    <select class="form-select">
                        <option selected>All category</option>
                        <option>Crops</option>
                        <option>Livestock</option>
                        <option>Poultry</option>
                        <option>Fisheries</option>
                    </select>
                </div>
                <div class="col-md-2 col-6">
                    <input type="date" value="02.05.2021" class="form-control">
                </div>
                <div class="col-md-2 col-6">
                    <select class="form-select">
                        <option selected>Status</option>
                        <option>Active</option>
                        <option>Disabled</option>
                        <option>Show all</option>
                    </select>
                </div>
            </div>
        </header>

        <div class="card-body">
            @foreach ($products as $product)
            <article class="itemlist">
                <div class="row align-items-center">
                    <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                        <a class="itemside" href="{{ route('vendor.edit-product', $product->string_id) }}">
                            <div class="left">
                                <img src="{{ asset('frontend/images/items/'.$product->thumbnail.'') }}" class="img-sm img-thumbnail" alt="Item">
                            </div>
                            <div class="info">
                                <h6 class="mb-0">{{ $product->name }}</h6>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-price"> <span>₱{{number_format($product->price)}}</span> </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-status">
                        <span class="badge rounded-pill alert-success">Active</span>
                    </div>
                    <div class="col-lg-2 col-sm-2 col-4 col-date">
                        <span>{{$product->created_at->diffForHumans()}}</span>
                    </div>
                    <div class="col-lg-1 col-sm-2 col-4 col-action">
                        <div class="dropdown float-end">
                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                    class="material-icons md-more_horiz"></i> </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">View detail</a>
                                <a class="dropdown-item" href="#">Edit info</a>
                                <a class="dropdown-item text-danger" href="#">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
            @endforeach
        </div>
    </div>

</section>
@endsection
