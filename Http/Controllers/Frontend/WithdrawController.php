<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Withdraw;
use Illuminate\Http\Request;

class WithdrawController extends Controller
{
    public function withdraw(Customer $customer)
    {
        return view('frontend.customer.withdrawal', compact('customer'));
    }


    public function paymentRequest(Request $request)
    {
        $request->validate([
            'amount' => 'required|numeric|min:1000', // Minimum withdrawal amount
            'payment_method' => 'required|string',
        ]);

        // Get the customer
        $customer = Customer::find($request->customer_id);

        // Calculate the maximum withdrawable amount
        $maxWithdrawable = max(0, $customer->referral_balance - 200);

        // Check if the withdrawal amount is valid
        if ($request->amount > $maxWithdrawable) {
            return back()->with('error', 'You must have Maximum withdrawable amount: ' . $maxWithdrawable . ' TK.');
        }


        // Deduct balance & create withdrawal request
        Withdraw::create([
            'customer_id' => $customer->id,
            'amount' => $request->amount,
            'payment_method' => $request->payment_method,
            'status' => 'pending',
        ]);

        return back()->with('success', 'Payment request submitted successfully!');
    }


    // payment request
    // public function paymentRequest(Request $request)
    // {
    //     $request->validate([
    //         'amount' => 'required|numeric|min:100', // Minimum withdrawal amount
    //         'payment_method' => 'required|string',
    //     ]);

    //     $customer = Customer::find($request->customer_id);

    //     if ($customer->referral_balance < $request->amount) {
    //         return back()->with('error', 'Insufficient balance!');
    //     }
    //     // Deduct balance & create withdrawal request
    //     Withdraw::create([
    //         'customer_id' => $customer->id,
    //         'amount' => $request->amount,
    //         'payment_method' => $request->payment_method,
    //         'status' => 'pending',
    //     ]);
    //     return back()->with('success', 'Payment request submitted successfully!');
    // }
}
