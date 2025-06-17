<?php

use Illuminate\Support\Facades\Route;
use Agribilis\Http\Controllers\ProductController;

Route::controller(ProductController::class)->group(function () {
    Route::get('product/{string_id}', 'index')->name('product');
    Route::get('products/{mainCategory?}/{subCategory?}/{subSubCategory?}', 'products')->name('search.products');

    //file handling
    Route::get('/product/image/{filename}', 'viewImage')->name('product.image');
});