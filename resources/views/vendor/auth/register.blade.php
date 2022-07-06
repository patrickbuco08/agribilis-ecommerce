@extends('layouts.backend.app', ['title' => 'Sign Up Today!'])

@section('content')
<section class="content-main">
    <div class="card shadow mx-auto" style="max-width: 480px; margin-top:60px;">
        <div class="card-body">
            <h4 class="card-title mb-4">Sign Up</h4>
            <form action="{{ route('vendor.register') }}" method="POST">
                @csrf
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="full_name" value="{{ old('full_name') }}"
                        class="form-control @error('full_name') is-invalid @enderror" placeholder="Type Full Name">
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="text" name="email" value="{{ old('email') }}"
                        class="form-control @error('email') is-invalid @enderror" placeholder="Type email">
                </div>
                <div class="mb-3">
                    <label class="form-label">Create password</label>
                    <div class="row gx-2">
                        <div class="col-6">
                            <input type="password" name="password"
                                class="form-control @error('password') is-invalid @enderror" placeholder="Password">
                        </div>
                        <div class="col-6">
                            <input type="password" name="password_confirmation" class="form-control"
                                placeholder="Repeat Password">
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Shop Name</label>
                    <input type="text" name="shop_name" value="{{ old('shop_name') }}"
                        class="form-control @error('shop_name') is-invalid @enderror" placeholder="Your Shop Name">
                </div>
                <div class="mb-3">
                    <label class="form-label">Shop Description</label>
                    <textarea name="description"
                        class="form-control @error('description') is-invalid @enderror">{{ old('description') }}</textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Shop Location</label>
                    <input type="text" name="location" value="{{ old('location') }}"
                        class="form-control @error('location') is-invalid @enderror"
                        placeholder="Your Shop Location">
                </div>
                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <input type="text" name="phone" value="{{ old('phone') }}"
                        class="form-control @error('phone') is-invalid @enderror"
                        placeholder="landline or phone number">
                </div>
                <div class="mb-4">
                    <button type="submit" class="btn btn-primary w-100"> Submit </button>
                </div>

            </form>
            <p class="text-center mb-2">Don't have account? <a href={{ route('vendor.login') }}>Sign In</a></p>
        </div>
    </div>
</section>
@endsection
