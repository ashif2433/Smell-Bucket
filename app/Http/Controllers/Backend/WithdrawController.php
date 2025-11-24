<?php

namespace App\Http\Controllers\Backend;

use App\Models\Withdraw;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Customer;

class WithdrawController extends Controller
{
    // index the withdraw
    public function index()
    {
        $withdraws = Withdraw::orderBy('id', 'desc')->get();
        return view('admin.pages.withdraw.index', compact('withdraws'));
    }

    // edit the withdraw
    function edit(Withdraw $withdraw) {
        return view('admin.pages.withdraw.edit', compact('withdraw'));
    }

    // update the withdraw
    public function update(Request $request, Withdraw $withdraw)
    {
        // validate the request
        $request->validate([
            'status' => 'required',
            'transaction_id' => 'nullable'
        ]);

        // update the status
        if ($request->status == 'approved') {
            // validate the transaction id
            $request->validate([
                'transaction_id' => 'required',
            ]);
            // get the current balance
            $currentBalance = $withdraw->customer->referral_balance;
            // calculate the new balance
            $newBalance = $currentBalance - $withdraw->amount;

            // update the balance
            $withdraw->customer->update([
                'referral_balance' => max(0, $newBalance)
            ]);

            // update the status
            $withdraw->update([
                'status' => 'approved',
                'transaction_id' => $request->transaction_id
            ]);
        }

        // Redirect
        return redirect()->route('admin.withdraw.index')->with('success', 'Status Updated Successfully');
    }


    // delete the withdraw
    function delete(Withdraw $withdraw) {
        try {
            // delete the withdraw
            $withdraw->delete();
            // return success message
            return redirect()->back()->with('success', 'Withdraw deleted Successfully');
        } catch (\Throwable $th) {
            // return error message
            return redirect()->back()->with('error', $th->getMessage());
        }
    }
}
