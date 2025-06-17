<?php

use Illuminate\Support\Facades\Route;
use Agribilis\Http\Controllers\CheckoutController;

Route::controller(CheckoutController::class)->group(function () {
    Route::get('checkout', 'index')->name('user.checkout');
    Route::post('checkout/place-order', 'placeOrder')->name('place-order');
});