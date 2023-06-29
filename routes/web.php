<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginRegisterController;
use App\Http\Controllers\Catalogue\ProductController;
use App\Http\Controllers\Cart\CartController;
use App\Http\Controllers\Sales\OrderController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//Added below routes related to User login, logout and User Signup functionality
Route::controller(LoginRegisterController::class)->group(function () {
    Route::get('/register', 'register')->name('register');
    Route::post('/store', 'store')->name('store');
    Route::get('/login', 'login')->name('login');
    Route::post('/authenticate', 'authenticate')->name('authenticate');
    Route::get('/dashboard', 'dashboard')->name('dashboard');
    Route::post('/logout', 'logout')->name('logout');
});

//Added below routes related to Products list page, Add to Cart, Update cart item quantity, Delete cart item, Create/Place Order functionality
Route::get('products', [ProductController::class, 'index'])->name('products.list');
Route::get('/shopping-cart', [CartController::class, 'index'])->name('shopping.cart');
Route::get('/cart/{id}', [CartController::class, 'addItemToCart'])->name('additem.into.cart');
Route::patch('/update-shopping-cart', [CartController::class, 'updateCartItem'])->name('update.cart.item');
Route::delete('/delete-cart-product', [CartController::class, 'deleteCartItem'])->name('delete.cart.item');
Route::post('createorder', [OrderController::class, 'createOrder'])->name('cart.checkout');
