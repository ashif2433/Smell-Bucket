<?php

namespace App\Http\Controllers\Backend;
use App\Http\Controllers\Controller;
use App\Models\Refund;
use Illuminate\Http\Request;

class RefundController extends Controller
{
    public function refundcreate()
    {
        return view ('admin.pages.refund.create');
    }
    public function refundmanage()
    {
        $refund = Refund::all();
        return view ('admin.pages.refund.manage', compact('refund'));
    }
    public function refundstore(Request $request)
    {
        $validated = $request->validate([
            'rdetails' => 'nullable',
        ]);
        $input = $request->all();

        // if ($image = $request->file('image')) {
        //     $destinationPath = 'images/';
        //     $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
        //     $image->move($destinationPath, $profileImage);
        //     $input['image'] = "$profileImage";
        // }

        // dd($input);
        Refund::create($input);

        return redirect()->back()->with('success', 'Refund created');
    }

    public function refundedit($id)
    {
        $post = Refund::findorfail($id);
        return view ('admin.pages.refund.edit', compact('post'));
    }

    public function refundupdate($id, Request $request) {

        $post = Refund::findorfail($id);
        $validated = $request->validate([
            'rdetails' => 'nullable',
        ]);


        $input = $request->all();

        // if ($image = $request->file('image')) {
        //     $destinationPath = 'images/';
        //     $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
        //     $image->move($destinationPath, $profileImage);
        //     $input['image'] = "$profileImage";
        // }else{
        //     unset($input['image']);
        // }

        $post->update($input);

        return redirect()->route('admin.refundmanage')->with('success', 'Refund updated');
    }

    public function refunddelete($id) {
        $post = Refund::findorfail($id);
        $post->delete();
        return redirect()->back()->with('success', 'Refund deleted');
    }
}
