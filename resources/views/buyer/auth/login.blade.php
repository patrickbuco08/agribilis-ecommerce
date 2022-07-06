@extends('layouts.frontend.app', ['title' => 'Login now to start shopping | Agribilis'])

@section('content')
<section class="section-conten padding-y" style="min-height:84vh">
    <div class="card mx-auto" style="max-width: 380px; margin-top:100px;">
        <div class="card-body">
            <h4 class="card-title mb-4">Sign in</h4>
            <a href="#" class="btn btn-facebook btn-block mb-2"> <i class="fab fa-facebook-f"></i> &nbsp Sign in
                with Facebook</a>
            <a href={{ route('google.login') }} class="btn btn-google btn-block mb-4"> <i class="fab fa-google"></i> &nbsp Sign in with
                Google</a>
            <form action={{ route('login') }} method="POST">
                @csrf
                <div class="form-group">
                    <input name="email" class="form-control @error('email') is-invalid @enderror" placeholder="Username" value="{{ old('email') }}" type="text">
                    @error('email')
                    <span class="form-text">{{$message}}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <input name="password" class="form-control @error('password') is-invalid @enderror" placeholder="Password" type="password">
                    @error('password')
                    <span class="form-text">{{$message}}</span>
                    @enderror
                </div>

                <div class="form-group">
                    <a href="#" class="float-right">Forgot password?</a>
                    <label class="float-left custom-control custom-checkbox"> <input type="checkbox" name="remember"
                            class="custom-control-input" checked="">
                        <div class="custom-control-label"> Remember </div>
                    </label>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block"> Login </button>
                </div>
            </form>
        </div>
    </div>
    <p class="text-center mt-4">Don't have account? <a href={{ route('register') }}>Sign up</a></p>
    <br><br>
</section>
@endsection
