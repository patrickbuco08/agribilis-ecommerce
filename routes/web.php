<?php

use App\Http\Controllers\AddressController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\SocialController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\FakerController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\OverviewController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Vendor\DashboardController;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


//CUSTOMER---------------------------------------------------------------------

//home
Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/contact-us', function(){
    return view('contact-us');
})->name('contact-us');

Route::get('about-us', function(){
    return view('about-us');
})->name('about-us');

//login
Route::get('login', [LoginController::class, 'index'])->name('login');
Route::post('login', [LoginController::class, 'store']);

//register
Route::get('register', [RegisterController::class, 'index'])->name('register');
Route::post('register', [RegisterController::class, 'store']);

//verify email
Route::get('/email/verify', function () {
    return view('vendor.auth.verify-email');
})->middleware('auth')->name('verification.notice');

//email verification handler
Route::get('/email/verify/{id}/{hash}', function (EmailVerificationRequest $request) {
    $request->fulfill();
    return redirect()->route('vendor.dashboard');
})->middleware(['auth', 'signed'])->name('verification.verify');

//resending the verification email
Route::post('/email/verification-notification', function (Request $request) {
    $request->user()->sendEmailVerificationNotification();
 
    return back()->with('message', 'Verification link sent!');
})->middleware(['auth', 'throttle:6,1'])->name('verification.send');

//social login
Route::get('google-login', [SocialController::class, 'loginWithGoogle'])->name('google.login');
Route::any('google/callback', [SocialController::class, 'callbackFromGoogle'])->name('google.callback');

//logout
Route::post('logout', [LogoutController::class, 'store'])->name('logout');

//user->overview
Route::get('user/overview', [OverviewController::class, 'index'])->name('user.overview');
Route::get('stores', [UserController::class, 'vendors'])->name('vendors');
Route::get('store/{user:full_name}', [UserController::class, 'vendor'])->name('vendor');

//user->address
Route::get('user/address/{address?}', [AddressController::class, 'index'])->name('user.address')->where('address', '[0-9]+');
Route::post('user/address/{address?}', [AddressController::class, 'store']);
Route::put('user/address/{address}', [AddressController::class, 'setAsDefault']);
Route::delete('user/address/{address}', [AddressController::class, 'destroy']);

//user->product
Route::get('product/{string_id}', [ProductController::class, 'index'])->name('product');
Route::get('products/{mainCategory?}/{subCategory?}/{subSubCategory?}', [ProductController::class, 'products'])->name('search.products');

//cart
Route::get('cart', [CartController::class, 'index'])->name('user.cart');
Route::post('cart/{product:string_id}/add', [CartController::class, 'store']);
Route::post('cart/{product:string_id}/buy', [CartController::class, 'buyNow']);
Route::put('cart/{cart}/update-quantity', [CartController::class, 'updateQuantity']);
Route::delete('cart/{cart}/delete', [CartController::class, 'destroy'])->name('user.cart.destroy');

//checkout
Route::get('checkout', [CheckoutController::class, 'index'])->name('user.checkout');

//place order
Route::post('checkout/place-order', [CheckoutController::class, 'placeOrder'])->name('place-order');

//order
Route::get('user/orders/{status?}', [OrderController::class, 'index'])->name('user.orders');
Route::get('order/success', [OrderController::class, 'orderSuccess'])->name('order.success');
Route::get('order/{order}/item/{item}', [OrderController::class, 'orderStatus'])->name('order.status');

//file handling
Route::get('/product/image/{filename}', [ProductController::class, 'viewImage'])->name('product.image');

//faker
//in case of refresh migration, go to public\sql_backup\sql_data.txt and insert this before creating fake data
Route::get('faker/create-products', [FakerController::class, 'createProducts']);
Route::get('faker/create-user', [FakerController::class, 'createUser']);


Route::get('sub-category/{categoryID}/get', [CategoryController::class, 'getSubCategory']);
Route::get('sub-sub-category/{subCategoryID}/get', [CategoryController::class, 'getSubSubCategory']);

// --------------------------Vendor--------------------------------------------------------------------
Route::prefix('vendor')->group(function () {
    Route::name('vendor.')->group(function(){
        Route::get('/login', [LoginController::class, 'vendorIndex'])->name('login');
        Route::post('/login', [LoginController::class, 'vendorStore']);

        Route::get('/register', [RegisterController::class, 'vendorIndex'])->name('register');
        Route::post('/register', [RegisterController::class, 'vendorStore']);

        Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

        Route::get('product/add', [ProductController::class, 'vendorIndex'])->name('add-product');
        Route::get('product/{product:string_id}/edit', [ProductController::class, 'showEditProduct'])->name('edit-product');
        Route::post('product/{product:string_id}/edit', [ProductController::class, 'updateProduct']);

        Route::get('product-list', [ProductController::class, 'productList'])->name('product-list');
        Route::post('add-product', [ProductController::class, 'storeProduct'])->name('store-product');

        Route::get('/order/{transaction}', [OrderController::class, 'orderDetail'])->name('order.detail');
        Route::put('/order/{order}/cancel-order', [OrderController::class, 'cancelOrder'])->name('order.cancel');
        Route::put('/order/{transaction}/change-status', [OrderController::class, 'changeStatus'])->name('order.change-status');
        Route::put('/order/{transaction}/change-approval-status', [OrderController::class, 'changeApprovalStatus'])->name('order.change-approval-status');
    });
});

