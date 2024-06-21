<?php

namespace Agribilis\Http\Controllers\Auth;

use Agribilis\Http\Controllers\Controller;
use Agribilis\Http\Requests\LoginRequest;
use Agribilis\Models\User;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function __construct(){
        $this->middleware(['guest']);
    }

    public function index(){
        return view('buyer.auth.login');
    }

    public function store(LoginRequest $request)
    {
        $validated = $request->validated();
        if(!auth()->attempt($request->validated(), $request->remember)){
            return back()->with('status', 'Invalid login details');
        }
        return redirect()->route('home');
    }

    // vendor
    public function vendorIndex(){
        return view('vendor.auth.login');
    }

    public function vendorStore(LoginRequest $request)
    {
        $validated = $request->validated();
        $user = User::where('email', $validated['email'])->first();

        if(!$user){
            return back()->with('status', 'Invalid login details.');
        }

        if(!$user->isVendor()){
            return back()->with('Unauthorized', 'You`re not allowed to enter this site.');
        }

        if(!auth()->attempt($request->validated(), $request->remember)){
            return back()->with('status', 'Invalid login details.');
        }
        return redirect()->route('vendor.dashboard');
    }
}
