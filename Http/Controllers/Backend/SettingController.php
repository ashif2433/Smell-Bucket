<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\AllSetting;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    public function index()
    {
        $data = AllSetting::first();
        return view('admin.pages.administration.setting', compact('data'));
    }
    // public function update_setting(Request $request, $id)
    // {
    //     try {
    //         $updateData = [];

    //         if ($request->d_charge_inside_dhaka != '' || $request->d_charge_inside_dhaka !=  null) {
    //             $updateData['d_charge_inside_dhaka'] = $request->d_charge_inside_dhaka;
    //         }
    //         if ($request->d_charge_outside_dhaka != '' || $request->d_charge_outside_dhaka !=  null) {
    //             $updateData['d_charge_outside_dhaka'] = $request->d_charge_outside_dhaka;
    //         }

    //         AllSetting::where('id', $id)->update($updateData);
    //         return redirect()->back()->with('message', 'Updated successfully');
    //     } catch (\Throwable $th) {
    //         return $th->getMessage();
    //         return redirect()->back()->with('message', 'Something Wrong! try later...');
    //     }
    // }

    public function update_setting(Request $request, $id)
{
    try {
        $updateData = [];

        if (!empty($request->d_charge_inside_dhaka)) {
            $updateData['d_charge_inside_dhaka'] = $request->d_charge_inside_dhaka;
        }

        if (!empty($request->d_charge_outside_dhaka)) {
            $updateData['d_charge_outside_dhaka'] = $request->d_charge_outside_dhaka;
        }

        if ($request->has('urban')) {
            $updateData['urban'] = (int) $request->urban;
        }

        AllSetting::where('id', $id)->update($updateData);

        return redirect()->back()->with('message', 'Updated successfully');
    } catch (\Throwable $th) {
        // Optionally log the error if needed
        return redirect()->back()->with('message', 'Something went wrong! Try again later.');
    }
}





}
