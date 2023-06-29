<?php

namespace App\Http\Controllers\Sales;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Order;
use App\Models\OrderProduct;

class OrderController extends Controller
{
    /**
     * Store Order related data under orders table in database
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createOrder(Request $request)
    {
        $request->validate([
            'delivery_address' => 'required|max:250'
        ]);

        $cart = session()->get('cart');
        $totalAmount = 0;
        foreach ($cart as $item) {
            $totalAmount += $item['product_price'] * $item['product_quantity'];
        }

        $orderData = new Order();
        $orderData->customer_id = Auth::user()->id;
        $orderData->price = $totalAmount;
        $orderData->delivery_address = $request->delivery_address;
        $orderData->save();

        foreach ($cart as $key=>$item) {
            $orderProductData = new OrderProduct();
            $orderProductData->order_id = $orderData->id;
            $orderProductData->product_id = $item['product_id'];
            $orderProductData->save();
        }
        $request->session()->forget('cart');

        return view('order.thanks')
            ->with('order', $orderData);
    }
}
