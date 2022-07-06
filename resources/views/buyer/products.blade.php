@extends('layouts.frontend.app')

@section('content')

<section class="section-content padding-y">
    <div class="container">

        <div class="row">

            <aside class="col-md-3">

                <div class="card">
                    <article class="filter-group">
                        <header class="card-header">
                            <a href="#" data-toggle="collapse" data-target="#collapse_1" aria-expanded="true" class="">
                                <i class="icon-control fa fa-chevron-down"></i>
                                <h6 class="title">Categories</h6>
                            </a>
                        </header>
                        <div class="filter-content collapse show" id="collapse_1" style="">
                            <div class="card-body">
                                <h5 class="card-title">Product type</h5>
                                <ul class="list-menu">
                                    @forelse ($categories as $category)
                                    <li>
                                        <a href={{ route('search.products', [
                                            'mainCategory' => $category->string_id,
                                            'price' => request()->get('price')
                                        ]) }}
                                            class="@if($categorySearch['main'] == $category->string_id) text-success @endif">{{ $category->name }}
                                            <span
                                                class="badge badge-pill badge-light float-right @if($categorySearch['main'] == $category->string_id) text-success @endif">
                                                {{$category->products()}}
                                            </span>
                                        </a>
                                    </li>
                                    @empty
                                    <li>
                                        <a href="#">
                                            Crops <span class="badge badge-pill badge-light float-right">Empty</span>
                                        </a>
                                    </li>
                                    @endforelse
                                </ul>
                            </div>
                        </div>
                    </article>
                    @if ($subCategories)
                    <article class="filter-group">
                        <header class="card-header">
                            <a href="#" data-toggle="collapse" data-target="#collapse_2" aria-expanded="false"
                                class="collapsed">
                                <i class="icon-control fa fa-chevron-down"></i>
                                <h6 class="title">Subcategories <span
                                        class="badge badge-pill badge-light">{{$subCategories->count()}}</span></h6>
                            </a>
                        </header>
                        <div class="filter-content collapse" id="collapse_2" style="">
                            <div class="card-body">
                                <ul class="list-menu">
                                    @forelse ($subCategories as $subCategory)
                                    <li>
                                        <a href="{{ $subCategory->products() ? route('search.products', [
                                                'mainCategory' => $categorySearch['main'],
                                                'subCategory' => $subCategory->string_id,
                                                'price' => request()->get('price')
                                            ]) : '#' }}"
                                            class="@if($categorySearch['sub'] == $subCategory->string_id) text-success @endif">{{ $subCategory->name }}
                                            <span class="badge badge-pill badge-light float-right @if($categorySearch['sub'] == $subCategory->string_id) text-success @endif">{{$subCategory->products()}}
                                            </span>
                                        </a>
                                    </li>
                                    @empty
                                    <li><a href="#">Crops <span class="badge badge-pill badge-light float-right">Empty</span></a></li>
                                    @endforelse
                                </ul>
                            </div>
                        </div>
                    </article>
                    @endif

                    @if ($subSubCategories)
                    <article class="filter-group">
                        <header class="card-header">
                            <a href="#" data-toggle="collapse" data-target="#collapse_3" aria-expanded="false" class="">
                                <i class="icon-control fa fa-chevron-down"></i>
                                <h6 class="title">Sub subcategories <span
                                        class="badge badge-pill badge-light">{{$subSubCategories->count()}}</span></h6>
                            </a>
                        </header>
                        <div class="filter-content collapse" id="collapse_3" style="">
                            <div class="card-body">
                                <ul class="list-menu">
                                    @forelse ($subSubCategories as $subSubCategory)
                                    <li>
                                        <a href="{{ $subSubCategory->products() ? route('search.products', [
                                            'mainCategory' => $categorySearch['main'],
                                            'subCategory' => $categorySearch['sub'],
                                            'subSubCategory' => $subSubCategory->string_id,
                                            'price' => request()->get('price')
                                        ]) : '#' }}"
                                            class="@if($categorySearch['subSub'] == $subSubCategory->string_id) text-success @endif">
                                            {{ $subSubCategory->name }}
                                            <span
                                                class="badge badge-pill badge-light float-right @if($categorySearch['subSub'] == $subSubCategory->string_id) text-success @endif">{{$subSubCategory->products()}}</span></a>
                                    </li>
                                    @empty
                                    <li><a href="#">Crops <span
                                                class="badge badge-pill badge-light float-right">Empty</span></a></li>
                                    @endforelse
                                </ul>
                            </div>
                        </div>
                    </article>
                    @endif

                </div>
            </aside>

            <div class="col-md-9">
                
                <header class="border-bottom mb-4 pb-3">
                    <div class="form-inline">
                        <span class="mr-md-auto">{{$count}} {{Str::plural('Item', $count)}} found</span>
                        <form action="{{ route('search.products') }}" method="GET">
                            @if (request()->get('search'))
                            <input type="text" name="search" value="{{request()->get('search')}}" hidden />
                            @endif
                            <select class="mr-2 form-control" name="price" onchange="this.form.submit()">
                                <option value="low-to-high" selected>Price low to high </option>
                                <option value="high-to-low" @if(request()->get('price') == "high-to-low") selected @endif>Price high to low</option>
                            </select>
                        </form>
                    </div>
                </header>

                <div class="row">
                    @forelse ($products as $product)
                    <x-product-card :product="$product" :size=4 />
                    @empty
                    no product
                    @endforelse
                </div>

                {{$products->links()}}

            </div>

        </div>

    </div>
</section>
@endsection
