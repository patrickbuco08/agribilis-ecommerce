<?php

use Illuminate\Support\Facades\Route;

use Agribilis\Http\Controllers\CategoryController;

Route::controller(CategoryController::class)->group(function () {
    Route::get('sub-category/{categoryID}/get', 'getSubCategory');
    Route::get('sub-sub-category/{subCategoryID}/get', 'getSubSubCategory');
});
