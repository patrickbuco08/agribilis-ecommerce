<?php

use Illuminate\Support\Facades\Route;
use Agribilis\Http\Controllers\Vendor\DashboardController;
use Agribilis\Http\Controllers\ProductController;
use Agribilis\Http\Controllers\OrderController;
use Agribilis\Http\Controllers\Auth\LoginController;
use Agribilis\Http\Controllers\Auth\RegisterController;

Route::prefix('vendor')->name('vendor.')->group(function () {
    // Login routes
    Route::controller(LoginController::class)->group(function () {
        Route::get('/login', 'vendorIndex')->name('login');
        Route::post('/login', 'vendorStore');
    });

    // Register routes
    Route::controller(RegisterController::class)->group(function () {
        Route::get('/register', 'vendorIndex')->name('register');
        Route::post('/register', 'vendorStore');
    });

    // Dashboard routes
    Route::controller(DashboardController::class)->group(function () {
        Route::get('/dashboard', 'index')->name('dashboard');
    });

    // Product routes
    Route::controller(ProductController::class)->group(function () {
        Route::get('product/add', 'vendorIndex')->name('add-product');
        Route::post('product/add', 'storeProduct');
        Route::get('product/{product:string_id}/edit', 'showEditProduct')->name('edit-product');
        Route::post('product/{product:string_id}/edit', 'updateProduct');
        Route::get('product-list', 'productList')->name('product-list');
    });

    // Order routes
    Route::controller(OrderController::class)->group(function () {
        Route::get('/order/{transaction}', 'orderDetail')->name('order.detail');
        Route::put('/order/{order}/cancel-order', 'cancelOrder')->name('order.cancel');
        Route::put('/order/{transaction}/change-status', 'changeStatus')->name('order.change-status');
        Route::put('/order/{transaction}/change-approval-status', 'changeApprovalStatus')->name('order.change-approval-status');
    });
});