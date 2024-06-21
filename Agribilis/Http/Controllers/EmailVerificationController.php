<?php

namespace Agribilis\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\EmailVerificationRequest;

class EmailVerificationController extends Controller
{

    public function verify()
    {
        return view('vendor.auth.verify-email');
    }

    public function verificationHandler(EmailVerificationRequest $request)
    {
        $request->fulfill();
        return redirect()->route('vendor.dashboard');
    }

    public function resendVerification(Request $request)
    {
        $request->user()->sendEmailVerificationNotification();
        return back()->with('message', 'Verification link sent!');
    }
}
