<?php

namespace App\Http\Controllers\Backend;
use App\Http\Controllers\Controller;
use App\Models\Tandc;
use Illuminate\Http\Request;

class TandcController extends Controller
{
    public function termscreate()
    {
        return view ('admin.pages.terms.create');
    }
    public function termsmanage()
    {
        $terms = Tandc::all();
        return view ('admin.pages.terms.manage', compact('terms'));
    }
    public function termsstore(Request $request)
    {
        $validated = $request->validate([
            'details' => 'nullable',
        ]);
        $input = $request->all();

        // if ($image = $request->file('image')) {
        //     $destinationPath = 'images/';
        //     $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
        //     $image->move($destinationPath, $profileImage);
        //     $input['image'] = "$profileImage";
        // }

        // dd($input);
        Tandc::create($input);

        return redirect()->back()->with('success', 'terms created');
    }

    public function termsedit($id)
    {
        $post = Tandc::findorfail($id);
        return view ('admin.pages.terms.edit', compact('post'));
    }

    public function termsupdate($id, Request $request) {

        $post = Tandc::findorfail($id);
        $validated = $request->validate([
            'details' => 'nullable',
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

        return redirect()->route('admin.termsmanage')->with('success', 'terms updated');
    }

    public function termsdelete($id) {
        $post = Tandc::findorfail($id);
        $post->delete();
        return redirect()->back()->with('success', 'terms deleted');
    }
}
