<?php

namespace App\Http\Controllers\Catalogue;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::get();
        if(Auth::check()) {
            return view('catalogue.index')->with('products', $products);
        }

        return redirect()->route('login')
            ->withErrors([
            'email' => 'Please login to see the products and add them into Cart!',
        ])->onlyInput('email');
    }
}
