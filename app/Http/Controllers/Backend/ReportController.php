<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;  // Import the Product model

class ReportController extends Controller
{
    public function productStock() {
        $products = Product::withSum('orderDetails', 'quantity')
        ->orderBy('created_at', 'desc')
        ->get()
        ->map(function ($product) {
            // Apply discount calculation
            if ($product->discount_type === 'flat') {
                $product->main_price = $product->selling_price - $product->discount_price;
            } elseif ($product->discount_type === 'percent') {
                $product->main_price = $product->selling_price - ($product->selling_price * ($product->discount_price / 100));
            } else {
                $product->main_price = $product->selling_price; // No discount
            }

            // Calculate remaining stock
            $product->remaining_stock = $product->quantity - ($product->order_details_sum_quantity ?? 0);

            return $product;
        });

        return view('admin.pages.stocks.product_stk', compact('products'));
    }


    public function productSale() {
        $products = Product::withSum('orderDetails', 'quantity') // Sum of sold quantity
        ->orderBy('created_at', 'desc')
        ->get()
        ->map(function ($product) {
            if ($product->discount_type === 'flat') {
                $product->main_price = $product->selling_price - $product->discount_price;
            } elseif ($product->discount_type === 'percent') {
                $product->main_price = $product->selling_price - ($product->selling_price * ($product->discount_price / 100));
            } else {
                $product->main_price = $product->selling_price;
            }

            $product->remaining_stock = $product->quantity - ($product->order_details_sum_quantity ?? 0);

            $product->total_sales = $product->order_details_sum_quantity ?? 0;

            $product->sales_value = $product->main_price * $product->total_sales;

            return $product;
        });

        // Calculate the total sum of sales value (main_price * total_sales)
        $totalSalesValue = $products->sum('sales_value'); // This will sum all the sales_value for each product

        return view('admin.pages.stocks.product_sale', compact('products', 'totalSalesValue'));
    }
    public function productWishlist() {}
    public function lowStockProduct() {
        $products = Product::withSum('orderDetails', 'quantity') // Sum of sold quantity
        ->orderBy('created_at', 'desc')
        ->get()
        ->map(function ($product) {
            // Apply discount calculation
            if ($product->discount_type === 'flat') {
                $product->main_price = $product->selling_price - $product->discount_price;
            } elseif ($product->discount_type === 'percent') {
                $product->main_price = $product->selling_price - ($product->selling_price * ($product->discount_price / 100));
            } else {
                $product->main_price = $product->selling_price; // No discount
            }

            // Calculate remaining stock
            $product->remaining_stock = $product->quantity - ($product->order_details_sum_quantity ?? 0);

            // Calculate total sales (quantity sold)
            $product->total_sales = $product->order_details_sum_quantity ?? 0;

            return $product;
        });

        // Get products with remaining stock less than 10
        $lowStockProducts = $products->filter(function ($product) {
        return $product->remaining_stock < 10;
    });

    return view('admin.pages.stocks.low_product', compact('lowStockProducts'));

    }
}
