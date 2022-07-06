<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Laravel\Socialite\Facades\Socialite;

class SocialController extends Controller
{
    public function loginWithGoogle()
    {
        return Socialite::driver('google')->redirect();
    }

    public function callbackFromGoogle()
    {
        try {
            $googleUser = Socialite::driver('google')->user();

            $user = User::where('email', '=', $googleUser->email);

            if($user->exists()){
                $user = $user->get()->first();
            }else{
                $user = User::create([
                    'full_name' => $googleUser->name,
                    'email'     => $googleUser->email,
                    'password'  => Hash::make($googleUser->name."@".$googleUser->id),
                ])->role([
                    'role_id' => 3
                ]);
            }
            Auth::loginUsingId($user->id, $remember = true);
            return redirect()->route('home');
        } catch (\Throwable $th) {
            return back()->with('error', 'Something Went Wrong');
        }
    }
}
