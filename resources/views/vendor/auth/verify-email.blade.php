<!DOCTYPE HTML>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Verify Your Account</title>
    <link href="{{ asset('frontend/images/logos/agribilis-logo.jpg') }}" rel="shortcut icon" type="image/x-icon">
    <link href="{{ asset('backend/css/bootstrap.css?v=1.1') }}" rel="stylesheet" type="text/css" />
    <!-- custom style -->
    <link href="{{ asset('backend/css/ui.css?v=1.1') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('backend/css/responsive.css?v=1.1') }}" rel="stylesheet" />
    <!-- iconfont -->
    <link rel="stylesheet" href="{{ asset('backend/fonts/material-icon/css/round.css') }}" />
</head>

<body>
    <b class="screen-overlay"></b>
    <main>
        <x-backend.header />
        <section class="content-main">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card mt-3">
                            <div class="card-header">Verify Your Email Address</div>

                            <div class="card-body">
                                @if (session('message'))
                                <div class="alert alert-success" role="alert">
                                    A fresh verification link has been sent to your email address.
                                </div>
                                @endif
                                Hi <b>{{auth()->user()->full_name}}</b>, <br /><br />
                                Before proceeding, please check your email for a verification link. If you did not
                                receive the email
                                <form class="pt-3" method="POST" action="{{ route('verification.send') }}">
                                    @csrf
                                    <button type="submit" class="btn btn-info">click here to request another</button>
                                    <br /><br />
                                    Once verified, you can <br />
                                    <a href={{ route('vendor.dashboard') }} class="btn btn-success">Proceed to the
                                        Website</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <script type="text/javascript">
        if (localStorage.getItem("darkmode")) {
            var body_el = document.body;
            body_el.className += 'dark';
        }

    </script>
<script src="{{ asset('backend/js/jquery-3.5.0.min.js') }}"></script>
<script src="{{ asset('backend/js/bootstrap.bundle.min.js') }}"></script>

<!-- Custom JS -->
<script src="{{ asset('backend/js/script.js?v=1.0') }}" type="text/javascript"></script>
</body>

</html>
