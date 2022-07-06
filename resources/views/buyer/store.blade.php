@extends('layouts.frontend.app', ['title' => $user->info->shop_name." | Agribilis Philippines"])

@section('content')
<section class="section-content py-4 bg">

    <div class="container">
        <div class="card">
            <div class="card-header bg-warning" style="height:300px">
            {{-- {{$user}} --}}

            </div>
            {{-- <div class="card-header" style="height:300px;
                background-image: url('../images/banners/banner3.jpg');
                background-repeat: no-repeat;
                background-size: cover;">
            </div> --}}
            <div class="card-body">
                <div class="row">
                    <div class="col-xl col-lg flex-grow-0" style="flex-basis:220px">
                        <div class="img-thumbnail shadow w-100 bg-danger position-relative text-center rounded-circle"
                            style="height:200px;
                            width:200px;
                            margin-top:-120px;
                            background-image: url('{{ asset('frontend/images/avatars/'.$user->info->photo.'') }}');
                            background-repeat: no-repeat;
                            background-size: cover;
                            border-width: .3rem;
                            cursor: pointer;">
                            {{-- <img src={{ asset('frontend/images/avatars/avatar1.jpg') }} class="center-xy img-fluid" alt="Logo Brand"> --}}
                        </div>
                    </div>
                    <div class="col-xl col-lg">
                        <h3>{{ $user->info->shop_name }}</h3>
                        <p>{{ $user->info->description }}</p>
                    </div>
                </div>
                <hr class="my-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-lg-4 col-xl-3">
                        <h6>Contacts</h6>
                        <p>
                            Manager: {{ $user->full_name }} <br>
                            {{ $user->email }} <br>
                            {{ $user->info->phone }}
                        </p>
                    </div>
                    <div class="col-sm-6 col-lg-4 col-xl-3">
                        <h6>Address</h6>
                        <p>
                            {{ $user->info->location }}
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </div>

</section>

<section class="section-content padding-y">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <header class="border-bottom mb-4 pb-3">
                    <div class="form-inline">
                        <span class="mr-md-auto">{{$count}} {{Str::plural('Item', $count)}} found</span>
                        <form action="/store/{{$user->full_name}}" method="GET">
                            @if (request()->get('search'))
                            <input type="text" name="search" value="{{request()->get('search')}}" hidden />
                            @endif
                            <select class="mr-2 form-control" name="price" onchange="this.form.submit()">
                                <option value="low-to-high" selected>Price low to high </option>
                                <option value="high-to-low" @if(request()->get('price') == "high-to-low") selected @endif>Price high
                                    to low</option>
                            </select>
                        </form>
                    </div>
                </header>
            
                <div class="row">
                    @forelse ($products as $product)
                    <x-product-card :product="$product" :size=3 />
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
