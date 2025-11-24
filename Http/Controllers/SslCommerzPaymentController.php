<?php

namespace App\Http\Controllers;

use App\Library\SslCommerz\SslCommerzNotification;
use App\Models\AllSetting;
use App\Models\Customer;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\PendingOrder;
use App\Models\Product;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class SslCommerzPaymentController extends Controller
{

    public function index( Request $request )
    {
        $request->validate( [
            "payment_type" => "required|string",
            "name"         => "required|string",
            "phone"        => "required",
            "address"      => "required|string",
        ] );

        if ( $request->payment_type == 'cash' ) {
            return $this->processCashOnDelivery( $request );
        } else {
            return $this->processSSLCommerzPayment( $request );
        }

    }

    private function processCashOnDelivery( $request )
    {
        DB::beginTransaction();
        try {
            $setting  = AllSetting::first();
            $customer = Customer::find( $request->customer_id );

            $deliveryCharge = $request->delivery_charge == 'inside' ? $setting->d_charge_inside_dhaka : $setting->d_charge_outside_dhaka;

            if ($request->delivery_charge === 'inside') {
                $deliveryCharge = $setting->d_charge_inside_dhaka;
            } elseif ($request->delivery_charge === 'outside') {
                $deliveryCharge = $setting->d_charge_outside_dhaka;
            } elseif ($request->delivery_charge === 'urban') {
                $deliveryCharge = $setting->urban;
            } else {
                $deliveryCharge = 0; // Default fallback or throw error if needed
            }



            $orders         = Order::get();
            $gtotal         = (float) str_replace( ',', '', Cart::subtotal() );

            // Generate Unique Transaction ID
            $transaction_id = uniqid();

            $order = Order::create( [
                "user_id"          => Auth::check() ? Auth::id() : 1,
                "order_no"         => date( 'ymdHis' ) . rand( 100, 999 ),
                "customer_name"    => $request->name,
                "customer_phone"   => $request->phone,
                "shipping_address" => $request->address,
                "delivery_status"  => 'Pending',
                "payment_type"     => $request->payment_type,
                "payment_status"   => 'Cash On Delivery',
                "grand_total"      => $gtotal,
                "delivery_charge"  => $deliveryCharge,
                "total"            => $gtotal + $deliveryCharge,
                "discount"         => 0,
                "tracking_code"    => date( 'ymd' ) . $orders->count() + 1 . date( 'His' ),
                "date"             => date( 'Y-m-d' ),
                "customer_id"      => $customer->id ?? null,
                'transaction_id'   => $transaction_id,
                'status'           => 'pending',
                'note'             => $request->note,
            ] );

            foreach ( Cart::content() as $product ) {
                //  dd($product->options->color);
                $pDetails = Product::find( $product->id );
                OrderDetails::create( [
                    "order_id"         => $order->id,
                    "seller_id"        => $pDetails->user_id,
                    "product_id"       => $product->id,
                    "product_name"     => $product->name,
                    "product_price"    => $pDetails->selling_price,
                    "sell_price"       => $product->price,
                    "product_discount" => productDiscount( $product->id ) * $product->qty,
                    "quantity"         => $product->qty,
                    "size"             => $product->options->size,
                    // "color"            => $product->options->code,
                    "color"            => $product->options->color,
                    "subtotal"         => $product->subtotal,
                ] );
            }

            DB::commit();
        } catch ( \Throwable $th ) {
            DB::rollBack();
            throw $th;
        }

        Cart::destroy();
        return redirect()->route( 'order.success', $order->order_no );
    }

    private function processSSLCommerzPayment( $request )
    {
        // try {


            $setting  = AllSetting::first();
            // $customer = Customer::find( $request->customer_id );
            // $customer = Customer::find($request->customer_id) ?? Customer::first();

            $deliveryCharge = $request->delivery_charge == 'inside' ? $setting->d_charge_inside_dhaka : $setting->d_charge_outside_dhaka;
            $orders         = Order::get();
            $gtotal         = (float) str_replace( ',', '', Cart::subtotal() );

            $post_data                 = array();
            $post_data['total_amount'] = $gtotal + $deliveryCharge; # You cant not pay less than 10
            $post_data['currency']     = "BDT";
            $post_data['tran_id']      = uniqid(); // tran_id must be unique

            # CUSTOMER INFORMATION
            $post_data['cus_name']     = $request->name;
            $post_data['cus_email']    = 'customer@mail.com';
            $post_data['cus_add1']     = $request->address;
            $post_data['cus_add2']     = "";
            $post_data['cus_city']     = "";
            $post_data['cus_state']    = "";
            $post_data['cus_postcode'] = "";
            $post_data['cus_country']  = "Bangladesh";
            $post_data['cus_phone']    = $request->phone;
            $post_data['cus_fax']      = "";

            # SHIPMENT INFORMATION
            $post_data['ship_name']     = "Store Test";
            $post_data['ship_add1']     = "Dhaka";
            $post_data['ship_add2']     = "Dhaka";
            $post_data['ship_city']     = "Dhaka";
            $post_data['ship_state']    = "Dhaka";
            $post_data['ship_postcode'] = "1000";
            $post_data['ship_phone']    = "";
            $post_data['ship_country']  = "Bangladesh";

            $post_data['shipping_method']  = "NO";
            $post_data['product_name']     = "Computer";
            $post_data['product_category'] = "Goods";
            $post_data['product_profile']  = "physical-goods";

            # OPTIONAL PARAMETERS
            $post_data['value_a'] = "ref001";
            $post_data['value_b'] = "ref002";
            $post_data['value_c'] = "ref003";
            $post_data['value_d'] = "ref004";

            // #Before  going to initiate the payment order status need to insert or update as Pending.
            // Store order data in session for later use

            // Store order data in session with all necessary data
            $pendingOrder = PendingOrder::create( [
                'order_no'         => date( 'ymdHis' ) . rand( 100, 999 ),
                'customer_name'    => $request->name,
                'customer_phone'   => $request->phone,
                'total'            => $post_data['total_amount'],
                'grand_total'      => $gtotal,
                'shipping_address' => $request->address,
                'payment_type'     => $request->payment_type,
                'payment_status'   => 'Pay Online',
                'delivery_charge'  => $deliveryCharge,
                'tracking_code'    => date( 'ymd' ) . ( $orders->count() + 1 ) . date( 'His' ),
                'date'             => date( 'Y-m-d' ),
                'customer_id'      => $customer->id ?? null,
                'currency'         => $post_data['currency'],
                'cart_items'       => json_encode( Cart::content()->toArray() ), // Store as JSON
                'transaction_id'   => $post_data['tran_id'],
            ] );

            $sslc            = new SslCommerzNotification();
            $payment_options = $sslc->makePayment( $post_data, 'hosted' );

            if (  ! is_array( $payment_options ) ) {
                print_r( $payment_options );
                $payment_options = array();
            }

        // } catch ( \Exception $e ) {
        //     Log::error( 'Error in processSSLCommerzPayment: ' . $e->getMessage() );
        //     return redirect()->back()->with( 'error', 'Something went wrong. Please try again.' );
        // }

        // $order = Order::updateOrCreate(
        //     ['transaction_id' => $post_data['tran_id']], // Search condition
        //     [
        //         "order_no"         => date('ymdHis') . rand(100, 999),
        //         'customer_name'    => $post_data['cus_name'],
        //         'customer_phone'   => $post_data['cus_phone'],
        //         'total'            => $post_data['total_amount'],
        //         'status'           => 'pending',
        //         'grand_total'      => $gtotal,
        //         'shipping_address' => $post_data['cus_add1'],
        //         'payment_type'     => $request->payment_type,
        //         'payment_status'   => $request->payment_type == 'cash' ? 'Cash On Delivery' : 'Pay Online',
        //         'delivery_charge'  => $deliveryCharge,
        //         'tracking_code'    => date('ymd') . ($orders->count() + 1) . date('His'),
        //         'date'             => date('Y-m-d'),
        //         'customer_id'      => $customer->id ?? null,
        //         'currency'         => $post_data['currency'],
        //     ]
        // );

        // foreach (Cart::content() as $product) {
        //     $pDetails = Product::find($product->id);
        //     OrderDetails::create([
        //         "order_id"         => $order->id,
        //         "seller_id"        => $pDetails->user_id,
        //         "product_id"       => $product->id,
        //         "product_name"     => $product->name,
        //         "product_price"    => $pDetails->selling_price,
        //         "sell_price"       => $product->price,
        //         "product_discount" => productDiscount($product->id) * $product->qty,
        //         "quantity"         => $product->qty,
        //         "size"             => $product->options->size,
        //         "color"            => $product->options->color,
        //         "subtotal"         => $product->subtotal,
        //     ]);
        // }

        // $sslc = new SslCommerzNotification();
        // # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
        // $payment_options = $sslc->makePayment( $post_data, 'hosted' );

        // if (  ! is_array( $payment_options ) ) {
        //     print_r( $payment_options );
        //     $payment_options = array();
        // }
    }

    public function success( Request $request )
    {
        $tran_id  = $request->input( 'tran_id' );
        $amount   = $request->input( 'amount' );
        $currency = $request->input( 'currency' );

        $sslc = new SslCommerzNotification();

        $validation = $sslc->orderValidate( $request->all(), $tran_id, $amount, $currency );

        if ( $validation ) {
            DB::beginTransaction();
            try {

            // Get pending order data from session
            $pendingOrder = PendingOrder::where('transaction_id', $tran_id)->first();

            // if the customer is logged in, add the customer to the session
            if ($pendingOrder->customer_id) {
                $customer = Customer::find($pendingOrder->customer_id);
                $request->session()->put('customer_id', $customer->id);
                $request->session()->put('customer_name', $customer->name);
            }

            // ✅ Create a new Order
            $order = Order::create([
                'order_no'         => $pendingOrder->order_no,
                'customer_id'      => $pendingOrder->customer_id,
                'customer_name'    => $pendingOrder->customer_name,
                'customer_phone'   => $pendingOrder->customer_phone,
                'total'            => $pendingOrder->total,
                'grand_total'      => $pendingOrder->grand_total,
                'shipping_address' => $pendingOrder->shipping_address,
                'payment_type'     => $pendingOrder->payment_type,
                'payment_status'   => 'Paid', // ✅ Update to "Paid"
                'delivery_charge'  => $pendingOrder->delivery_charge,
                'tracking_code'    => $pendingOrder->tracking_code,
                'date'             => $pendingOrder->date,
                'currency'         => $pendingOrder->currency,
                'cart_items'       => $pendingOrder->cart_items, // Keep cart items in order
                'transaction_id'   => $pendingOrder->transaction_id,
            ]);

            // Create order details
            $cartItems = json_decode( $pendingOrder->cart_items, true );
            foreach ( $cartItems as $item ) {
                $pDetails = Product::find( $item['id'] );
                OrderDetails::create( [
                    "order_id"         => $order->id,
                    "seller_id"        => $pDetails->user_id,
                    "product_id"       => $item['id'],
                    "product_name"     => $item['name'],
                    "product_price"    => $pDetails->selling_price,
                    "sell_price"       => $item['price'],
                    "product_discount" => productDiscount( $item['id'] ) * $item['qty'],
                    "quantity"         => $item['qty'],
                    "size"             => $item['options']['size'],
                    "color"            => $item['options']['color'],
                    "subtotal"         => $item['subtotal'],
                ] );
            }

            // ✅ Remove Pending Order
            $pendingOrder->delete();

            // ✅ Destroy the cart
            Cart::destroy();

            DB::commit();

            return redirect()->route( 'order.success', $order->order_no );

            } catch (\Exception $e) {
                DB::rollBack();
                Log::error('Error creating order: ' . $e->getMessage());
                return redirect()->route('home')->with('error', 'Something went wrong.');
            }


        }

        return redirect()->back()->with( 'error', 'Payment validation failed' );
    }



    // public function fail( Request $request )
    // {
    //     $tran_id = $request->input( 'tran_id' );

    //     // if the customer is logged in, add the customer to the session
    //     $order_details = Order::where( 'transaction_id', $tran_id )
    //         ->first();

    //     if ( $order_details->customer_id ) {
    //         $customer = Customer::find( $order_details->customer_id );
    //         $request->session()->put( 'customer_id', $customer->id );
    //         $request->session()->put( 'customer_name', $customer->name );
    //     }

    //     if ( $order_details->status == 'Pending' ) {
    //         $update_product = DB::table( 'orders' )
    //             ->where( 'transaction_id', $tran_id )
    //             ->update( ['status' => 'Failed'] );
    //         echo "Transaction is Falied";
    //     } else if ( $order_details->status == 'Processing' || $order_details->status == 'Complete' ) {
    //         echo "Transaction is already Successful";
    //     } else {
    //         echo "Transaction is Invalid";
    //     }

    // }

    public function fail(Request $request)
{
    $tran_id = $request->input('tran_id');

    // Find the order
    $order_details = Order::where('transaction_id', $tran_id)->first();

    // If order not found, handle it gracefully
    if (!$order_details) {
        return response('Transaction is Invalid', 404);
    }

    // If customer ID exists (not guest), put in session
    if (!is_null($order_details->customer_id)) {
        $customer = Customer::find($order_details->customer_id);

        if ($customer) {
            $request->session()->put('customer_id', $customer->id);
            $request->session()->put('customer_name', $customer->name);
        }
    }

    // Handle transaction status
    if ($order_details->status == 'Pending') {
        DB::table('orders')
            ->where('transaction_id', $tran_id)
            ->update(['status' => 'Failed']);

        return response('Transaction has failed', 200);
    } elseif (in_array($order_details->status, ['Processing', 'Complete'])) {
        return response('Transaction is already successful', 200);
    } else {
        return response('Transaction is invalid', 400);
    }
}


    public function cancel( Request $request )
    {
        $tran_id = $request->input( 'tran_id' );

        $order_details = DB::table( 'orders' )
            ->where( 'transaction_id', $tran_id )
            ->first();

        // if the customer is logged in, add the customer to the session
        if ( $order_details->customer_id ) {
            $customer = Customer::find( $order_details->customer_id );
            $request->session()->put( 'customer_id', $customer->id );
            $request->session()->put( 'customer_name', $customer->name );
        }

        if ( $order_details->status == 'Pending' ) {
            $update_product = DB::table( 'orders' )
                ->where( 'transaction_id', $tran_id )
                ->update( ['status' => 'Canceled'] );
            echo "Transaction is Cancel";
        } else if ( $order_details->status == 'Processing' || $order_details->status == 'Complete' ) {
            echo "Transaction is already Successful";
        } else {
            echo "Transaction is Invalid";
        }

    }

    public function ipn( Request $request )
    {
        #Received all the payement information from the gateway
        if ( $request->input( 'tran_id' ) ) #Check transation id is posted or not.
        {

            $tran_id = $request->input( 'tran_id' );

            #Check order status in order tabel against the transaction id or order id.
            $order_details = DB::table( 'orders' )
                ->where( 'transaction_id', $tran_id )
                ->first();

            // if the customer is logged in, add the customer to the session
            if ( $order_details->customer_id ) {
                $customer = Customer::find( $order_details->customer_id );
                $request->session()->put( 'customer_id', $customer->id );
                $request->session()->put( 'customer_name', $customer->name );
            }

            if ( $order_details->status == 'Pending' ) {
                $sslc       = new SslCommerzNotification();
                $validation = $sslc->orderValidate( $request->all(), $tran_id, $order_details->amount, $order_details->currency );
                if ( $validation == true ) {
                    /*
                    That means IPN worked. Here you need to update order status
                    in order table as Processing or Complete.
                    Here you can also sent sms or email for successful transaction to customer
                     */
                    $update_product = DB::table( 'orders' )
                        ->where( 'transaction_id', $tran_id )
                        ->update( ['status' => 'Processing'] );

                    echo "Transaction is successfully Completed";
                }
            } else if ( $order_details->status == 'Processing' || $order_details->status == 'Complete' ) {

                #That means Order status already updated. No need to udate database.

                echo "Transaction is already successfully Completed";
            } else {
                #That means something wrong happened. You can redirect customer to your product page.

                echo "Invalid Transaction";
            }
        } else {
            echo "Invalid Data";
        }
    }

}
