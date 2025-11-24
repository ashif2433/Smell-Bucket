<?php

namespace App\Http\Controllers\Backend;

use App\Models\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Carbon\Carbon;

class ReferralController extends Controller
{
    function index() {
        $referredBy = Customer::latest()->paginate();
        return view('admin.pages.refer.index', compact('referredBy'));
    }

    function edit(Customer $customer) {
        $referralBy = Customer::where('id', '!=', $customer->id)->get();
        return view('admin.pages.refer.edit', compact('customer', 'referralBy'));
    }

    public function update(Request $request, Customer $customer)
    {

        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'phone' => 'required',
            'referral_by' => 'nullable'
        ]);

        try {
            $customer->update([
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'referral_by' => $request->referral_by,

            ]);

            return redirect()->route('admin.refer.index')->with('success', 'Updated Successfully');
        } catch (\Throwable $th) {
            //throw $th;
            return redirect()->back()->with('error', $th->getMessage());
        }

    }

    function delete(Customer $customer) {
        try {
            $customer->delete();
            return redirect()->back()->with('success', 'Customer deleted Successfully');
        } catch (\Throwable $th) {
            //throw $th;
            return redirect()->back()->with('error', $th->getMessage());
        }
    }

    // referred Users filter
    function search(Request $request)
    {
        $query = Customer::query();

        if ($request->filled('start_date') && $request->filled('end_date')) {
            $startDate = Carbon::parse($request->start_date)->startOfDay();
            $endDate = Carbon::parse($request->end_date)->endOfDay();

            $query->whereBetween('created_at', [$startDate, $endDate]);
        }

        $referredBy = $query->with('referral')->get();
        $count = $referredBy->count();

        return view('admin.pages.refer.index', compact('referredBy', 'count'));
    }

}
