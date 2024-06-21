<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="csrf_token" content={{ csrf_token() }}>

  <title>Agribilis | Admin Dashboard</title>

  <link href="{{ asset('frontend/images/logos/agribilis-logo.jpg') }}" rel="shortcut icon" type="image/x-icon">

  <script src={{ asset('frontend/js/jquery-2.0.0.min.js') }} type="text/javascript"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

  <link href="{{ asset('backend/css/bootstrap.css?v=1.1') }}" rel="stylesheet" type="text/css"/>

  <!-- custom style -->
  <link href="{{ asset('backend/css/ui.css?v=1.1') }}" rel="stylesheet" type="text/css"/>
  <link href="{{ asset('backend/css/responsive.css?v=1.1') }}" rel="stylesheet" />

  <!-- iconfont -->
  <link rel="stylesheet" href="{{ asset('backend/fonts/material-icon/css/round.css') }}"/>

  <link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
  <script src="https://unpkg.com/@yaireo/tagify"></script>
  <script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
    <b class="screen-overlay"></b>
	@auth
	<x-backend.sidebar />
	@endauth
	<main class="@auth main-wrap @endauth">
		<x-backend.header />
		@yield('content')
	</main>

<script type="text/javascript">
	if(localStorage.getItem("darkmode")){
		var body_el = document.body;
		body_el.className += 'dark';
	}
</script>

<script src="{{ asset('backend/js/jquery-3.5.0.min.js') }}"></script>
<script src="{{ asset('backend/js/bootstrap.bundle.min.js') }}"></script>



<!-- Custom JS -->
<script src="{{ asset('backend/js/script.js?v=1.0') }}" type="text/javascript"></script>

{{-- <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
	    // The type of chart we want to create
	    type: 'line',

	    // The data for our dataset
	    data: {
	        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
	        datasets: [
	        {
	            label: 'Sales',
	            backgroundColor: 'rgb(44, 120, 220)',
	            borderColor: 'rgb(44, 120, 220)',
	            data: [18, 17, 4, 3, 2, 20, 25, 31, 25, 22, 20, 9]
	        },
	        {
	            label: 'Visitors',
	            backgroundColor: 'rgb(180, 200, 230)',
	            borderColor: 'rgb(180, 200, 230)',
	            data: [40, 20, 17, 9, 23, 35, 39, 30, 34, 25, 27, 17]
	        } 

	        ]
	    },

	    // Configuration options go here
	    options: {}
	});
</script> --}}

</body>
</html>