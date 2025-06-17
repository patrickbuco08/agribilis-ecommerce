<?php

use Illuminate\Support\Facades\Route;
use Agribilis\Http\Controllers\CartController;

Route::controller(CartController::class)->group(function () {
    Route::get('cart', 'index')->name('user.cart');
    Route::post('cart/{product:string_id}/add', 'store');
    Route::post('cart/{product:string_id}/buy', 'buyNow');
    Route::put('cart/{cart}/update-quantity', 'updateQuantity');
    Route::delete('cart/{cart}/delete', 'destroy')->name('user.cart.destroy');
});