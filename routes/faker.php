<?php

use Illuminate\Support\Facades\Route;
use Agribilis\Http\Controllers\FakerController;

//faker
Route::controller(FakerController::class)->group(function () {
    Route::get('faker/create-products', 'createProducts');
    Route::get('faker/create-user', 'createUser');
});