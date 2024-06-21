<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CartController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\FakerController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\AddressController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\OverviewController;
use App\Http\Controllers\AboutPageController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\Auth\SocialController;
use App\Http\Controllers\ContactPageController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Vendor\DashboardController;
use App\Http\Controllers\EmailVerificationController;


//CUSTOMER---------------------------------------------------------------------

//home
Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/contact-us', ContactPageController::class)->name('contact-us');
Route::get('/about-us', AboutPageController::class)->name('about-us');

//login
Route::controller(LoginController::class)->group(function () {
    Route::get('/login', 'index')->name('login');
    Route::post('/login', 'store');
});

//logout
Route::post('logout', [LogoutController::class, 'store'])->name('logout');

//register
Route::controller(RegisterController::class)->group(function () {
    Route::get('register', 'index')->name('register');
    Route::post('register', 'store');
});

// email verification
Route::controller(EmailVerificationController::class)->group(function () {
    Route::get('/email/verify', 'verify')->middleware('auth')->name('verification.notice');
    Route::get('/email/verify/{id}/{hash}', 'verificationHandler')->middleware(['auth', 'signed'])->name('verification.verify');
    Route::get('/email/verification-notification', 'resendVerification')->middleware(['auth', 'throttle:6,1'])->name('verification.send');
});

//social login
Route::controller(SocialController::class)->group(function () {
    Route::get('google-login', 'loginWithGoogle')->name('google.login');
    Route::any('google/callback', 'loginWithGoogle')->name('google.callback');
});

//user->overview
Route::get('user/overview', [OverviewController::class, 'index'])->name('user.overview');
Route::get('stores', [UserController::class, 'vendors'])->name('vendors');
Route::get('store/{user:full_name}', [UserController::class, 'vendor'])->name('vendor');

//user->address
Route::controller(AddressController::class)->group(function () {
    Route::get('user/address/{address?}', 'index')->name('user.address')->where('address', '[0-9]+');
    Route::post('user/address/{address?}', 'store');
    Route::put('user/address/{address}', 'setAsDefault');
    Route::delete('user/address/{address}', 'destroy');
});

//produt
Route::controller(ProductController::class)->group(function () {
    Route::get('product/{string_id}', 'index')->name('product');
    Route::get('products/{mainCategory?}/{subCategory?}/{subSubCategory?}', 'products')->name('search.products');

    //file handling
    Route::get('/product/image/{filename}', 'viewImage')->name('product.image');
});

//cart
Route::controller(CartController::class)->group(function () {
    Route::get('cart', 'index')->name('user.cart');
    Route::post('cart/{product:string_id}/add', 'store');
    Route::post('cart/{product:string_id}/buy', 'buyNow');
    Route::put('cart/{cart}/update-quantity', 'updateQuantity');
    Route::delete('cart/{cart}/delete', 'destroy')->name('user.cart.destroy');
});

//checkout | place order

Route::controller(CheckoutController::class)->group(function () {
    Route::get('checkout', 'index')->name('user.checkout');
    Route::post('checkout/place-order', 'placeOrder')->name('place-order');
});

//order
Route::controller(OrderController::class)->group(function () {
    Route::get('user/orders/{status?}', 'index')->name('user.orders');
    Route::get('order/success', 'orderSuccess')->name('order.success');
    Route::get('order/{order}/item/{item}', 'orderStatus')->name('order.status');
});

Route::controller(CategoryController::class)->group(function () {
    Route::get('sub-category/{categoryID}/get', 'getSubCategory');
    Route::get('sub-sub-category/{subCategoryID}/get', 'getSubSubCategory');
});

// Admin
Route::middleware(['guest'])->group(function () {
    // Route::prefix('admin')->group(function () {
    //     Route::name('admin.')->group(function () {
    //         Route::controller(LoginController::class)->group(function () {
    //             Route::get('/login', 'index')->name('login');
    //             Route::post('/login', 'store');
    //         });
    //     });
    // });
});

// --------------------------Vendor--------------------------------------------------------------------
Route::prefix('vendor')->group(function () {
    Route::name('vendor.')->group(function () {
        Route::get('/login', [LoginController::class, 'vendorIndex'])->name('login');
        Route::post('/login', [LoginController::class, 'vendorStore']);

        Route::get('/register', [RegisterController::class, 'vendorIndex'])->name('register');
        Route::post('/register', [RegisterController::class, 'vendorStore']);

        Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

        Route::get('product/add', [ProductController::class, 'vendorIndex'])->name('add-product');
        Route::post('product/add', [ProductController::class, 'storeProduct']);
        Route::get('product/{product:string_id}/edit', [ProductController::class, 'showEditProduct'])->name('edit-product');
        Route::post('product/{product:string_id}/edit', [ProductController::class, 'updateProduct']);

        Route::get('product-list', [ProductController::class, 'productList'])->name('product-list');

        Route::get('/order/{transaction}', [OrderController::class, 'orderDetail'])->name('order.detail');
        Route::put('/order/{order}/cancel-order', [OrderController::class, 'cancelOrder'])->name('order.cancel');
        Route::put('/order/{transaction}/change-status', [OrderController::class, 'changeStatus'])->name('order.change-status');
        Route::put('/order/{transaction}/change-approval-status', [OrderController::class, 'changeApprovalStatus'])->name('order.change-approval-status');
    });
});

//faker
Route::controller(FakerController::class)->group(function () {
    Route::get('faker/create-products', 'createProducts');
    Route::get('faker/create-user', 'createUser');
});
