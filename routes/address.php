<?php

use Illuminate\Support\Facades\Route;
use Agribilis\Http\Controllers\AddressController;

Route::controller(AddressController::class)->group(function () {
    Route::get('user/address/{address?}', 'index')->name('user.address')->where('address', '[0-9]+');
    Route::post('user/address/{address?}', 'store');
    Route::put('user/address/{address}', 'setAsDefault');
    Route::delete('user/address/{address}', 'destroy');
});
