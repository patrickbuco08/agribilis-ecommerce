<!DOCTYPE HTML>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="max-age=604800" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="csrf_token" content={{ csrf_token() }}>

    <meta property="og:site_name" content="E-Commerce Web Application">
    <meta property="og:title" content="AgriBilis Philippines">
    <meta property="og:url" content="{{ route('home') }}">
    <meta property="og:description" content="A website and mobile based application that will help in the marketing and distribution of agriculture
    and fishery products in Cavite, linking the farmers, fishers, and traders to the consumers for the transfer of consumer
    goods.">
    <meta property="og:image" content="{{ asset('og_agribilis.jpg') }}">
    <meta property="og:image:url" content="{{ asset('og_agribilis.jpg') }}">
    <meta property="twitter:image" content="{{ asset('og_agribilis.jpg') }}">

    <title>{{ $title ?? 'Agribilis' }}</title>

    <link href={{ asset('frontend/images/logos/agribilis-logo.png') }} rel="shortcut icon" type="image/x-icon">

    <script src={{ asset('frontend/js/jquery-2.0.0.min.js') }} type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script src={{ asset('frontend/js/bootstrap.bundle.min.js') }} type="text/javascript"></script>
    <link href={{ asset('frontend/css/bootstrap.css') }} rel="stylesheet" type="text/css" />

    <link href={{ asset('frontend/fonts/fontawesome/css/all.min.css') }} type="text/css" rel="stylesheet">

    <link href={{ asset('frontend/css/ui.css') }} rel="stylesheet" type="text/css" />
    <link href={{ asset('frontend/css/responsive.css') }} rel="stylesheet"
        media="only screen and (max-width: 1200px)" />

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src={{ asset('frontend/js/script.js') }} type="text/javascript"></script>
    <script src={{ asset('frontend/js/easy-number-separator.js') }} type="text/javascript"></script>

</head>
<style type="text/css">
    .h-82vh {
        min-height: 82vh;
    }
</style>

<body>
    <x-frontend.header />
    @yield('content')
    <x-frontend.footer />
    <script src={{ asset('frontend/js/main.js') }} type="text/javascript"></script>
</body>
</html>
