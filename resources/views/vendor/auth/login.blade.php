@extends('layouts.backend.app', ['title' => 'Vendor Login'])

@section('content')
<section class="content-main">
    <div class="card shadow mx-auto" style="max-width: 380px; margin-top:100px;">
        @if (session('Unauthorized'))
        <div class="alert alert-info m-3" role="alert">
            <p>Only vendors are allowed to enter this site.</p>
        </div>
        @endif
        @if (session('status'))
        <div class="alert alert-danger m-3" role="alert">
            <p>Invalid login details</p>
        </div>
        @endif
        <div class="card-body">
            <h4 class="card-title mb-4">Sign in</h4>
            <form action="{{ route('vendor.login') }}" method="POST">
                @csrf
                <div class="mb-3">
                    <input type="text" name="email" value="{{ old('email') }}" class="form-control @error('email') is-invalid @enderror" placeholder="Email">
                </div>
                <div class="mb-3">
                    <input type="password" name="password" class="form-control @error('password') is-invalid @enderror" placeholder="Password">
                </div>
                <div class="mb-3">
                    <a href="#" class="float-end">Forgot password?</a>
                    <label class="form-check">
                        <input type="checkbox" name="remember" class="form-check-input" checked="">
                        <span class="form-check-label">Remember</span>
                    </label>
                </div>
                <div class="mb-4">
                    <button type="submit" class="btn btn-primary w-100"> Login </button>
                </div>
            </form>
            <p class="text-center mb-4">Don't have account? <a href="{{ route('vendor.register') }}">Sign up</a></p>
        </div>
    </div>
</section>
@endsection
