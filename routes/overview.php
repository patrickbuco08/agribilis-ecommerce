<?php

use Illuminate\Support\Facades\Route;
use Agribilis\Http\Controllers\OverviewController;
use Agribilis\Http\Controllers\UserController;

//user->overview
Route::get('user/overview', [OverviewController::class, 'index'])->name('user.overview');
Route::get('stores', [UserController::class, 'vendors'])->name('vendors');
Route::get('store/{user:full_name}', [UserController::class, 'vendor'])->name('vendor');
