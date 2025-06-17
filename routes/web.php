<?php

use Illuminate\Support\Facades\Route;
use Agribilis\Http\Controllers\HomeController;
use Agribilis\Http\Controllers\AboutPageController;
use Agribilis\Http\Controllers\ContactPageController;

Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/contact-us', ContactPageController::class)->name('contact-us');
Route::get('/about-us', AboutPageController::class)->name('about-us');
