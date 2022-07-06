@extends('layouts.frontend.app', ['title' => 'Sign up today! | Agribilis'])

@section('content')
<section class="section-content padding-y">

    <div class="card mx-auto" style="max-width:520px; margin-top:40px;">
        <article class="card-body">
            <header class="mb-4">
                <h4 class="card-title">Sign up</h4>
            </header>
            <form action={{ route('register') }} method="POST">
                @csrf
                <div class="form-row">
                    <div class="col form-group">
                        <label>Full Name</label>
                        <input type="text" name="full_name" class="form-control" placeholder="">
                    </div>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" placeholder="">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Create password</label>
                        <input class="form-control" name="password" type="password">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Repeat password</label>
                        <input class="form-control" name="password_confirmation" type="password">
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block"> Register </button>
                </div>
                <div class="form-group">
                    <label class="custom-control custom-checkbox"> <input type="checkbox" name="agreement"
                            class="custom-control-input" checked="">
                        <div class="custom-control-label"> I am agree with <a href="#">terms and contitions</a> </div>
                    </label>
                </div>
            </form>
        </article>
    </div>
    <p class="text-center mt-4">Have an account? <a href="">Log In</a></p>
    <br><br>

</section>
@endsection
