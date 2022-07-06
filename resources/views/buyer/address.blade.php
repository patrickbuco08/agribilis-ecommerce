@extends('layouts.frontend.app', [])

@section('content')
<section class="section-content bg padding-y">
    <div class="container">
        <div class="row">
            <x-frontend.user-setting />
            <div class="col-md-9">
                <div class="card">
                    <div class="card-body">
                        @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            <h4 class="alert-heading">Success!</h4>
                            <p>Aww yeah, You've added a new address.</p>
                          </div>
                        @endif
                        <h4>New Address</h4>
                        <form action={{ route('user.address') }} method="POST">
                            @csrf
                            <div class="form-row">
                                <div class="col-md-6 form-group">
                                    <label>Full name</label>
                                    <input type="text" name="full_name" value="{{old('full_name')}}" class="form-control @error('full_name') is-invalid @enderror" placeholder="Ex. John Doe">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Phone</label>
                                    <input type="text" name="phone" value="{{old('phone')}}" class="form-control @error('phone') is-invalid @enderror" placeholder="Type here">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6 form-group">
                                    <label>Address</label>
                                    <input type="text" name="location" value="{{old('location')}}" class="form-control @error('location') is-invalid @enderror"
                                        placeholder="House/Unit/Flr #, Bldg Name, Blk or Lot #">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Postal Code</label>
                                    <input type="text" pattern="[0-9]*" value="{{old('postal_code')}}" name="postal_code" class="form-control @error('postal_code') is-invalid @enderror"
                                        placeholder="Postcode/zip">
                                    <input type="text" name="set_as_default" value="0" class="form-control @error('set_as_default') is-invalid @enderror" hidden>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row mt-3">

                    @forelse ($addresses as $address)
                    <div class="col-md-6">
                        <article class="card mb-4">
                            <div class="card-body">
                                <h6>{{ $address->location }}</h6>
                                <p>Full Name: {{ $address->full_name }} <br>
                                    Location: {{ $address->phone }} <br/>
                                    Postal Code: {{ $address->postal_code }}
                                </p>
                                <div class="d-flex">
                                    <form action={{ route('user.address', ['address' => $address->id]) }} class="mr-1" method="POST">
                                        @method('put')
                                        @csrf
                                        <button type="submit" class="btn btn-light" {{ $address->set_as_default ? 'disabled' : '' }}>{{ $address->set_as_default ? 'Default' : 'Make default' }}</button>
                                    </form>  
                                    <form action={{ route('user.address', ['address' => $address->id]) }} method="POST">
                                        @csrf
                                        @method('delete')
                                        <button type="submit" class="btn btn-light"><i class="text-danger fa fa-trash"></i></button>
                                    </form>
                                </div>
                            </div>
                        </article>
                    </div>
                    @empty
                    <div class="alert alert-info" role="alert">
                        {{-- <h4 class="alert-heading">Success!</h4> --}}
                        <p>You don't have addresses yet.</p>
                      </div>
                    @endforelse

                </div>

            </div>
        </div>
    </div>
</section>
@endsection
