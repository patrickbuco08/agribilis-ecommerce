<?php

use Illuminate\Support\Facades\Route;
use Agribilis\Http\Controllers\OrderController;

//order
Route::controller(OrderController::class)->group(function () {
    Route::get('user/orders/{status?}', 'index')->name('user.orders');
    Route::get('order/success', 'orderSuccess')->name('order.success');
    Route::get('order/{order}/item/{item}', 'orderStatus')->name('order.status');
});
