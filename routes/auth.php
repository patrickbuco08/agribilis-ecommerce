<?php

use Illuminate\Support\Facades\Route;
use Agribilis\Http\Controllers\Auth\LoginController;
use Agribilis\Http\Controllers\Auth\LogoutController;
use Agribilis\Http\Controllers\Auth\RegisterController;
use Agribilis\Http\Controllers\Auth\SocialController;
use Agribilis\Http\Controllers\EmailVerificationController;

//login
Route::controller(LoginController::class)->group(function () {
    Route::get('/login', 'index')->name('login');
    Route::post('/login', 'store');
});

//logout
Route::post('logout', [LogoutController::class, 'store'])->name('logout');

//register
Route::controller(RegisterController::class)->group(function () {
    Route::get('register', 'index')->name('register');
    Route::post('register', 'store');
});

// email verification
Route::controller(EmailVerificationController::class)->group(function () {
    Route::get('/email/verify', 'verify')->middleware('auth')->name('verification.notice');
    Route::get('/email/verify/{id}/{hash}', 'verificationHandler')->middleware(['auth', 'signed'])->name('verification.verify');
    Route::get('/email/verification-notification', 'resendVerification')->middleware(['auth', 'throttle:6,1'])->name('verification.send');
});

//social login
Route::controller(SocialController::class)->group(function () {
    Route::get('google-login', 'loginWithGoogle')->name('google.login');
    Route::any('google/callback', 'loginWithGoogle')->name('google.callback');
});