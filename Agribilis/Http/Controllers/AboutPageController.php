<?php

namespace Agribilis\Http\Controllers;

use Illuminate\Http\Request;

class AboutPageController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        return view('about-us');
    }
}
