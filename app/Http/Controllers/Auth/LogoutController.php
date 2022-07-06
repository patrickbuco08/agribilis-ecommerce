<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LogoutController extends Controller
{
    public function store(Request $request)
    {
        auth()->logout();
        if($request->has('redirect_vendor')){
            return redirect()->route('vendor.login');
        }
        return redirect()->route('home');
    }
}
