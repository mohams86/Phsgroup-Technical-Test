<?php

namespace App\Http\Controllers\Cart;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Product;

class CartController extends Controller
{
    /**
     * Fetch Cart data from Session and display Shopping Cart page.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cart = session()->get('cart');
        if ($cart == null) {
            $cart = [];
        }

        return view('cart.cart')->with('cart', $cart);
    }

    /**
     * Add item into User's cart based on Session data.
     *
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function addItemToCart($id)
    {
        $product = Product::findOrFail($id);
        $cart = session()->get('cart', []);

        if(isset($cart[$id])) {
            $cart[$id]['product_quantity']++;
        } else {
            $cart[$id] = [
                "product_id" => $id,
                "product_name" => $product->name,
                "product_quantity" => 1,
                "product_price" => $product->price
            ];
        }

        session()->put('cart', $cart);
        return redirect()->route('shopping.cart')
                        ->with('success', 'Product has been added to cart!');
    }

    /**
     * Update quantity under existing cart item's data.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function updateCartItem(Request $request)
    {
        if($request->id && $request->quantity) {
            $cart = session()->get('cart');
            $cart[$request->id]["product_quantity"] = $request->quantity;
            session()->put('cart', $cart);
            session()->flash('success', 'Cart updated successfully');
        }
    }

    /**
     * Delete an item from user's cart.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function deleteCartItem(Request $request)
    {
        if($request->id) {
            $cart = session()->get('cart');
            if(isset($cart[$request->id])) {
                unset($cart[$request->id]);
                session()->put('cart', $cart);
            }
            session()->flash('success', 'Product removed successfully');
        }
    }
}
