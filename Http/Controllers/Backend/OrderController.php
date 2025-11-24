<?php

namespace App\Http\Controllers\Backend;

use App\Models\Order;
use App\Models\Customer;
use App\Models\OrderDetails;
use App\Models\Product;
use App\Models\WebsiteInfo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Barryvdh\DomPDF\Facade\Pdf;
// use Barryvdh\DomPDF\Facade as PDF;

class OrderController extends Controller
{
    public function allOrders()
    {
        // $orderdetails = OrderDetails::all();
        $orders = Order::with('OrderDetails')->latest()->get();
        $colorMap = [
            1 => 'Green',
            2 => 'blue',
            3 => 'Black',
            4 => 'DarkSalmon',
            5 => 'LightSalmon',
            6 => 'Crimson',
            7 => 'Red',
            8 => 'FireBrick',
            9 => 'DarkRed',
            10 => 'Pink',
            11 => 'Navy Blue',
            12 => 'merun',
        ];
        // dd($orders);
        return view('admin.pages.orders.allorders', compact('orders','colorMap'));
    }

    public function editstatus($id) {
        // Fetch the order with the given ID and its details
        $order = Order::with('OrderDetails')->findOrFail($id);

        // Color map definition
        $colorMap = [
            1 => 'Green',
            2 => 'Blue',
            3 => 'Black',
            4 => 'DarkSalmon',
            5 => 'LightSalmon',
            6 => 'Crimson',
            7 => 'Red',
            8 => 'FireBrick',
            9 => 'DarkRed',
            10 => 'Pink',
            11 => 'Navy Blue',
            12 => 'Maroon',
        ];

        // dd($order);
        // dd($order->delivery_status);
        // Pass the specific order and color map to the view
        return view('admin.pages.orders.editstatus', compact('order', 'colorMap'));
    }


    public function updateStatus(Request $request, $id)
{
    // Find the order
    $order = Order::findOrFail($id);

    // Validate the request
    $request->validate([
        'delivery_status' => 'required',
    ]);

    // Only apply referral logic if order is marked as delivered
    if ($request->input('delivery_status') == 'Delivered') {

        // Check if the order is placed by a registered customer
        if ($order->customer_id) {
            $customer = Customer::find($order->customer_id);

            if ($customer) {
                // Check if this is customer's first qualifying order
                $isFirstOrder = Order::where('customer_id', $customer->id)
                    ->where('delivery_status', 'Delivered')
                    ->where('grand_total', '>=', 1000)
                    ->first();

                if (!empty($isFirstOrder) || $order->grand_total >= 1000) {

                    if (!empty($customer->referral_by)) {
                        // Buyer gets 5%
                        $buyerCommission = round($order->grand_total * 0.050);
                        $customer->increment('referral_balance', $buyerCommission);

                        // Level 1
                        $level1User = Customer::find($customer->referral_by);
                        if ($level1User) {
                            $level1Commission = round($order->grand_total * 0.030);
                            $level1User->increment('referral_balance', $level1Commission);

                            // Level 2
                            if (!empty($level1User->referral_by)) {
                                $level2User = Customer::find($level1User->referral_by);
                                if ($level2User) {
                                    $level2Commission = round($order->grand_total * 0.015);
                                    $level2User->increment('referral_balance', $level2Commission);

                                    // Level 3 (Master)
                                    if (!empty($level2User->referral_by)) {
                                        $masterUser = Customer::find($level2User->referral_by);
                                        if ($masterUser) {
                                            $masterCommission = round($order->grand_total * 0.005);
                                            $masterUser->increment('referral_balance', $masterCommission);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Update the delivery_status
    $updated = $order->update([
        'delivery_status' => $request->input('delivery_status'),
    ]);

    if (!$updated) {
        dd('Update failed');
    }

    return redirect()->route('admin.order.allOrders')->with('success', 'Delivery status updated successfully!');
}



    // public function pendingOrder() {
    //     $orders = Order::with('OrderDetails')
    //         ->where('delivery_status', 'Pending')
    //         ->latest() // Orders sorted by latest created_at
    //         ->get();

    //     $colorMap = [
    //         1 => 'Green',
    //         2 => 'Blue',
    //         3 => 'Black',
    //         4 => 'DarkSalmon',
    //         5 => 'LightSalmon',
    //         6 => 'Crimson',
    //         7 => 'Red',
    //         8 => 'FireBrick',
    //         9 => 'DarkRed',
    //         10 => 'Pink',
    //         11 => 'Navy Blue',
    //         12 => 'Merun',
    //     ];

    //     dd($orders);

    //     return view('admin.pages.orders.pendingorder', compact('orders', 'colorMap'));
    // }

    public function pendingOrder()
{
    $orders = Order::with('orderDetails') // Correct case!
        ->where('delivery_status', 'Pending')
        ->latest()
        ->get();

    $colorMap = [
        1 => 'Green',
        2 => 'Blue',
        3 => 'Black',
        4 => 'DarkSalmon',
        5 => 'LightSalmon',
        6 => 'Crimson',
        7 => 'Red',
        8 => 'FireBrick',
        9 => 'DarkRed',
        10 => 'Pink',
        11 => 'Navy Blue',
        12 => 'Merun',
    ];

    // dd($orders->toArray());

    return view('admin.pages.orders.pendingorder', compact('orders', 'colorMap'));
}



    public function approvedOrder() {
        $orders = Order::with('OrderDetails')
        ->where('delivery_status', 'Approved') // Filter orders with 'Pending' status
        ->latest()
        ->get();

        $colorMap = [
            1 => 'Green',
            2 => 'Blue',
            3 => 'Black',
            4 => 'DarkSalmon',
            5 => 'LightSalmon',
            6 => 'Crimson',
            7 => 'Red',
            8 => 'FireBrick',
            9 => 'DarkRed',
            10 => 'Pink',
            11 => 'Navy Blue',
            12 => 'Merun',
        ];

        return view('admin.pages.orders.approvedorder', compact('orders', 'colorMap'));
    }


    public function shippingOrder() {
        $orders = Order::with('OrderDetails')
        ->where('delivery_status', 'Shipping') // Filter orders with 'Pending' status
        ->latest()
        ->get();

        $colorMap = [
            1 => 'Green',
            2 => 'Blue',
            3 => 'Black',
            4 => 'DarkSalmon',
            5 => 'LightSalmon',
            6 => 'Crimson',
            7 => 'Red',
            8 => 'FireBrick',
            9 => 'DarkRed',
            10 => 'Pink',
            11 => 'Navy Blue',
            12 => 'Merun',
        ];

        return view('admin.pages.orders.shippingorder', compact('orders', 'colorMap'));
    }

    public function deliveredOrder() {
        $orders = Order::with('OrderDetails')
        ->where('delivery_status', 'Delivered') // Filter orders with 'Pending' status
        ->latest()
        ->get();

        $colorMap = [
            1 => 'Green',
            2 => 'Blue',
            3 => 'Black',
            4 => 'DarkSalmon',
            5 => 'LightSalmon',
            6 => 'Crimson',
            7 => 'Red',
            8 => 'FireBrick',
            9 => 'DarkRed',
            10 => 'Pink',
            11 => 'Navy Blue',
            12 => 'Merun',
        ];

        return view('admin.pages.orders.deliveredorder', compact('orders', 'colorMap'));
    }

    public function cancelledOrder() {
        $orders = Order::with('OrderDetails')
        ->where('delivery_status', 'Cancelled') // Filter orders with 'Pending' status
        ->latest()
        ->get();

        $colorMap = [
            1 => 'Green',
            2 => 'Blue',
            3 => 'Black',
            4 => 'DarkSalmon',
            5 => 'LightSalmon',
            6 => 'Crimson',
            7 => 'Red',
            8 => 'FireBrick',
            9 => 'DarkRed',
            10 => 'Pink',
            11 => 'Navy Blue',
            12 => 'Merun',
        ];

        return view('admin.pages.orders.cancelledorder', compact('orders', 'colorMap'));
    }


    // public function generateOrderPDF($orderId){

    //     $order = Order::with('OrderDetails')->findOrFail($orderId);
    //     $websiteInfo = WebsiteInfo::first();
    //     // dd($order);
    //     $pdf = PDF::loadView('admin.pages.orders.pdf', compact('order', 'websiteInfo'));
    //     return $pdf->download("order_{$order->order_no}.pdf");
    // }


    public function generateOrderPDF($orderId){

        $order = Order::with('OrderDetails')->findOrFail($orderId);
        $websiteInfo = WebsiteInfo::first();
        $colorMap = [
            1 => 'Green',
            2 => 'blue',
            3 => 'Black',
            4 => 'DarkSalmon',
            5 => 'LightSalmon',
            6 => 'Crimson',
            7 => 'Red',
            8 => 'FireBrick',
            9 => 'DarkRed',
            10 => 'Pink',
            11 => 'Navy Blue',
            12 => 'merun',
        ];
        // dd($order);
        $pdf = PDF::loadView('admin.pages.orders.pdf', compact('order', 'websiteInfo','colorMap'));
        return $pdf->download("order_{$order->order_no}.pdf");
    }









    public function inHouseOrders() {}
    public function sellerOrders() {}
}
