<?php

namespace App\Http\Controllers\Backend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Faq;

class FaqController extends Controller
{
    public function faqcreate()
    {
        return view ('admin.pages.faq.create');
    }
    public function faqmanage()
    {
        $faq = Faq::all();
        return view ('admin.pages.faq.manage', compact('faq'));
    }
    public function faqstore(Request $request)
    {
        $validated = $request->validate([
            'question' => 'nullable',
            'answer' => 'nullable',
        ]);
        $input = $request->all();

        // if ($image = $request->file('image')) {
        //     $destinationPath = 'images/';
        //     $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
        //     $image->move($destinationPath, $profileImage);
        //     $input['image'] = "$profileImage";
        // }

        // dd($input);
        Faq::create($input);

        return redirect()->back()->with('success', 'Faq created');
    }

    public function faqedit($id)
    {
        $post = Faq::findorfail($id);
        return view ('admin.pages.faq.edit', compact('post'));
    }

    public function faqupdate($id, Request $request) {

        $post = Faq::findorfail($id);
        $validated = $request->validate([
            'question' => 'nullable',
            'answer' => 'nullable',
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

        return redirect()->route('admin.faqmanage')->with('success', 'Faq updated');
    }

    public function faqdelete($id) {
        $post = Faq::findorfail($id);
        $post->delete();
        return redirect()->back()->with('success', 'Faq deleted');
    }
}
