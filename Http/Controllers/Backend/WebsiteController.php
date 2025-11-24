<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\Product;
use App\Models\HomeSlider;
use App\Models\Section;
use App\Models\SectionProduct;
use App\Models\SingleBanner;
use App\Models\Webrand;
use App\Models\Mapli;
use App\Models\Btob;
use App\Models\Topmar;
use App\Models\WebsiteInfo;
use App\Models\Subscriber;
use App\Models\PixelGtm;
use Illuminate\Http\Request;
use Intervention\Image\Laravel\Facades\Image;

class WebsiteController extends Controller
{
    public function websiteInfo()
    {
        $websiteInfo = WebsiteInfo::first();
        return view('admin.pages.website.info', compact('websiteInfo'));
    }


    public function websiteInfoUpdate(Request $request, $id)
    {
        // return $request;
        try {

            $item = websiteInfo::find($id);

            if ($request->file('logo')) {
                // Check if the file exists
                if (file_exists($item->logo)) {
                    // Delete the file
                    unlink($item->logo);
                }

                $image = $request->file('logo');
                $img = Image::read($image->getRealPath());
                $img->resize(900, 435);
                $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

                $img->save(public_path('uploads/' . $imageName));
                $file_image = 'uploads/' . $imageName;
            } else {
                $file_image = $item->logo;
            }

            $item->company_name  = $request->company_name;
            $item->address       = $request->address;
            $item->website       = $request->website;
            $item->email         = $request->email;
            $item->contact_no    = $request->contact_no;
            $item->working_hours = $request->working_hours;
            $item->facebook      = $request->facebook;
            $item->google_business       = $request->google_business;
            $item->youtube       = $request->youtube;
            $item->linkedin      = $request->linkedin;
            $item->logo          = $file_image;
            $item->contact_info  = $request->contact_info;
            $item->our_history   = $request->our_history;
            $item->update();

            return redirect()->route('admin.website.info')->with('success', 'Updated successfully.');
        } catch (\Throwable $th) {
            return $th->getMessage();
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }

    public function pixelGtm()
    {
        $pixelgtm = PixelGtm::all();
        return view('admin.pages.website.pixelgtm', compact('pixelgtm'));
    }

    public function pixelGtmedit($id)
    {
        $pixelgtm = PixelGtm::findorfail($id);
        return view('admin.pages.website.pixelgtmedit', compact('pixelgtm'));
    }


    public function pixelGtmupdate($id, Request $request) {

        $post = PixelGtm::findorfail($id);
        $validated = $request->validate([
            'pixel' => 'nullable',
            'gtm' => 'nullable',

        ]);

        $input = $request->all();
        $post->update($input);

        return redirect()->route('admin.pixelGtm')->with('success', 'Item Update successfully.');
    }


    public function homeSlider_index()
    {
        $banners = HomeSlider::whereNotNull('serial')->get();
        return view('admin.pages.website.homeSlider', compact('banners'));
    }
    // public function homeSection_create()
    // {
    //     $sections = section::get();
    //     $mood = 'create';
    //     return view('admin.pages.website.sections', compact('sections', 'mood'));
    // }
    public function homeSlider_store(Request $request)
    {
        $request->validate([
            'name'   => 'required|string|unique:home_sliders',
            'serial' => 'required|numeric|unique:home_sliders',
            'link'   => 'required|string',
            'image'  => 'required',
            'status' => 'required',
            'short_des' => 'nullable',
            'color' => 'nullable',
        ]);
        try {
            if ($request->file('image')) {
                $image = $request->file('image');
                $img = Image::read($image->getRealPath());
                $img->resize(250, 130);
                $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

                $img->save(public_path('uploads/' . $imageName));
                $file_image = 'uploads/' . $imageName;
            }

            HomeSlider::create([
                'name'   => $request->name ?? 'DHARA Collection',
                'serial' => $request->serial,
                'link'   => $request->link,
                'image'  => $file_image,
                'status' => $request->status,
                'short_des' => $request->short_des ?? null,
                'color' => $request->color ?? '#d8f6ff',
            ]);

            return redirect()->route('admin.home.homeSlider.index')->with('success', 'Item created successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }

    public function homeSlider_edit($id)
    {
        $data = HomeSlider::find($id);
        $banners = HomeSlider::whereNotNull('serial')->get();
        return view('admin.pages.website.homeSlider', compact('data', 'banners'));
    }

    public function homeSlider_update(Request $request, $id)
    {

        $request->validate([
            'name'   => 'required|string|unique:home_sliders,id,' . $id,
            'serial' => 'required|numeric|unique:home_sliders,serial,' . $id,
            'link'   => 'required|string',
            // 'image'  => 'required',
            'status' => 'required',
            'short_des' => 'nullable',
            'color' => 'nullable',

        ]);


        try {

            $item = HomeSlider::find($id);

            if ($request->file('image')) {
                // Check if the file exists
                if (file_exists($item->image)) {
                    // Delete the file
                    unlink($item->image);
                }

                $image = $request->file('image');
                $img = Image::read($image->getRealPath());
                $img->resize(900, 435);
                $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

                $img->save(public_path('uploads/' . $imageName));
                $file_image = 'uploads/' . $imageName;
            } else {
                $file_image = $item->image;
            }

            $item->name   = $request->name;
            $item->serial = $request->serial;
            $item->link   = $request->link;
            $item->image  = $file_image;
            $item->status = $request->status;
            $item->short_des = $request->short_des;
            $item->color = $request->color;
            $item->update();

            return redirect()->route('admin.home.homeSlider.index')->with('success', 'Updated successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }
    // public function homeSlider_delete($id)
    // {
    //     try {
    //         HomeSlider::findOrFail($id)->delete();

    //         return redirect()->route('admin.home.homeSlider.index')->with('success', 'Item deleted successfully.');
    //     } catch (\Throwable $th) {
    //         return redirect()->back()->with('error', 'Somethng going wrong. try later.');
    //     }
    // }

    public function homeSlider_delete($id) {
        $post = HomeSlider::findorfail($id);
        $post->delete();
        return redirect()->route('admin.home.homeSlider.index')->with('success', 'Item deleted successfully.');
    }

    //////////////////////////////////////////////////////////////////////////////////////////



    public function banner_index()
    {
        $banners = Banner::whereNotNull('serial')->get();
        return view('admin.pages.website.banners', compact('banners'));
    }
    // public function homeSection_create()
    // {
    //     $sections = section::get();
    //     $mood = 'create';
    //     return view('admin.pages.website.sections', compact('sections', 'mood'));
    // }
    public function banner_store(Request $request)
    {
        $request->validate([
            'name'   => 'required|string|unique:banners',
            'serial' => 'required|numeric|unique:banners',
            'link'   => 'required|string',
            'image'  => 'required',
            'status' => 'required'
        ]);
        try {
            if ($request->file('image')) {
                $image = $request->file('image');
                $img = Image::read($image->getRealPath());
                $img->resize(400, 250);
                $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

                $img->save(public_path('uploads/' . $imageName));
                $file_image = 'uploads/' . $imageName;
            }

            Banner::create([
                'name'   => $request->name,
                'serial' => $request->serial,
                'link'   => $request->link,
                'image'  => $file_image,
                'status' => $request->status,
            ]);

            return redirect()->route('admin.home.banner.index')->with('success', 'Item created successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }

    public function banner_edit($id)
    {
        $data = Banner::find($id);
        $banners = Banner::whereNotNull('serial')->get();
        return view('admin.pages.website.banners', compact('data', 'banners'));
    }

    public function banner_update(Request $request, $id)
    {

        $request->validate([
            'name'   => 'required|string|unique:banners,id,' . $id,
            'serial' => 'required|numeric|unique:banners,serial,' . $id,
            'link'   => 'required|string',
            // 'image'  => 'required',
            'status' => 'required'
        ]);


        try {

            $item         = Banner::find($id);

            if ($request->file('image')) {
                // Check if the file exists
                if (file_exists($item->image)) {
                    // Delete the file
                    unlink($item->image);
                }

                $image = $request->file('image');
                $img = Image::read($image->getRealPath());
                $img->resize(400, 250);
                $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

                $img->save(public_path('uploads/' . $imageName));
                $file_image = 'uploads/' . $imageName;
            } else {
                $file_image = $item->image;
            }

            $item->name   = $request->name;
            $item->serial = $request->serial;
            $item->link   = $request->link;
            $item->image  = $file_image;
            $item->status = $request->status;
            $item->update();

            return redirect()->route('admin.home.banner.index')->with('success', 'Updated successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }
    public function banner_delete($id)
    {
        try {
            Banner::findOrFail($id)->delete();

            return redirect()->route('admin.home.banner.index')->with('success', 'Item deleted successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////



    public function singleBanner_index()
    {
        $banners = SingleBanner::get();
        return view('admin.pages.website.singleBanner', compact('banners'));
    }
    // public function homeSection_create()
    // {
    //     $sections = section::get();
    //     $mood = 'create';
    //     return view('admin.pages.website.sections', compact('sections', 'mood'));
    // }
    public function singleBanner_store(Request $request)
    {
        $request->validate([
            'name'   => 'required|string|unique:single_banners',
            'link'   => 'required|string',
            'image'  => 'required',
            'status' => 'required'
        ]);
        try {
            if ($request->file('image')) {
                $image = $request->file('image');
                $img = Image::read($image->getRealPath());
                $img->resize(1200, 320);
                $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

                $img->save(public_path('uploads/' . $imageName));
                $file_image = 'uploads/' . $imageName;
            }

            SingleBanner::create([
                'name'   => $request->name,
                'link'   => $request->link,
                'image'  => $file_image,
                'status' => $request->status,
            ]);

            return redirect()->route('admin.home.singleBanner.index')->with('success', 'Item created successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }

    public function singleBanner_edit($id)
    {
        $data = SingleBanner::find($id);
        $banners = SingleBanner::get();
        return view('admin.pages.website.singleBanner', compact('data', 'banners'));
    }

    public function singleBanner_update(Request $request, $id)
    {

        $request->validate([
            'name'   => 'required|string|unique:single_banners,id,' . $id,
            'link'   => 'required|string',
            // 'image'  => 'required',
            'status' => 'required'
        ]);


        try {

            $item         = SingleBanner::find($id);

            if ($request->file('image')) {
                // Check if the file exists
                if (file_exists($item->image)) {
                    // Delete the file
                    unlink($item->image);
                }

                $image = $request->file('image');
                $img = Image::read($image->getRealPath());
                $img->resize(1200, 320);
                $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

                $img->save(public_path('uploads/' . $imageName));
                $file_image = 'uploads/' . $imageName;
            } else {
                $file_image = $item->image;
            }

            $item->name   = $request->name;
            $item->link   = $request->link;
            $item->image  = $file_image;
            $item->status = $request->status;
            $item->update();

            return redirect()->route('admin.home.singleBanner.index')->with('success', 'Updated successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }
    public function singleBanner_delete($id)
    {
        try {
            SingleBanner::findOrFail($id)->delete();

            return redirect()->route('admin.home.singleBanner.index')->with('success', 'Item deleted successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }




    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    public function homeSection_index()
    {
        $sections = Section::get();
        return view('admin.pages.website.sections', compact('sections'));
    }
    // public function homeSection_create()
    // {
    //     $sections = section::get();
    //     $mood = 'create';
    //     return view('admin.pages.website.sections', compact('sections', 'mood'));
    // }
    public function homeSection_store(Request $request)
    {
        $request->validate([
            'title'   => 'required',
            'name'   => 'required|string|unique:sections',
            // 'serial' => 'required|numeric',
            'status' => 'required'
        ]);
        try {
            Section::create($request->all());

            return redirect()->route('admin.home.section.index')->with('success', 'Item created successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }

    public function homeSection_edit($id)
    {
        $data = Section::find($id);
        $sections = Section::get();
        return view('admin.pages.website.sections', compact('data', 'sections'));
    }

    public function homeSection_update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'name'   => 'required|string|unique:sections,id,' . $id,
            // 'serial' => 'required|numeric',
            'status' => 'required'
        ]);


        try {
            $item         = Section::find($id);
            $item->title   = $request->title;
            $item->name   = $request->name;
            $item->serial = $request->serial;
            $item->status = $request->status;
            $item->update();

            return redirect()->route('admin.home.section.index')->with('success', 'Updated successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }
    public function homeSection_delete($id)
    {
        try {
            Section::findOrFail($id)->delete();

            return redirect()->route('admin.home.section.index')->with('success', 'Item deleted successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }
    // .............................................................................................................................

    // public function homeNewSection_index()
    // {
    //     $sections = Section::whereNull('serial')->get();
    //     return view('admin.pages.website.newSections', compact('sections'));
    // }
    // // public function homeSection_create()
    // // {
    // //     $sections = section::get();
    // //     $mood = 'create';
    // //     return view('admin.pages.website.sections', compact('sections', 'mood'));
    // // }
    // public function homeNewSection_store(Request $request)
    // {
    //     $request->validate([
    //         'name'   => 'required|string|unique:sections',
    //         'serial' => 'required|numeric',
    //         'status' => 'required'
    //     ]);
    //     try {
    //         Section::create($request->all());

    //         return redirect()->route('admin.home.section.index')->with('success', 'Item created successfully.');
    //     } catch (\Throwable $th) {
    //         return redirect()->back()->with('error', 'Somethng going wrong. try later.');
    //     }
    // }

    // public function homeNewSection_edit($id)
    // {
    //     $data = Section::find($id);
    //     $sections = Section::whereNotNull('serial')->get();
    //     return view('admin.pages.website.sections', compact('data', 'sections'));
    // }

    // public function homeNewSection_update(Request $request, $id)
    // {
    //     $request->validate([
    //         'name'   => 'required|string|unique:sections,id,' . $id,
    //         'serial' => 'required|numeric',
    //         'status' => 'required'
    //     ]);


    //     try {
    //         $item         = Section::find($id);
    //         $item->name   = $request->name;
    //         $item->serial = $request->serial;
    //         $item->status = $request->status;
    //         $item->update();

    //         return redirect()->route('admin.home.section.index')->with('success', 'Updated successfully.');
    //     } catch (\Throwable $th) {
    //         return redirect()->back()->with('error', 'Somethng going wrong. try later.');
    //     }
    // }
    // public function homeNewSection_delete($id)
    // {
    //     try {
    //         Section::findOrFail($id)->delete();

    //         return redirect()->route('admin.home.section.index')->with('success', 'Item deleted successfully.');
    //     } catch (\Throwable $th) {
    //         return redirect()->back()->with('error', 'Somethng going wrong. try later.');
    //     }
    // }

    // .......................................................................................................................

    public function sectionProductPublish()
    {
        $sections = Section::orderBy('serial', 'desc')->get();
        $products = Product::get();
        return view('admin.pages.website.sectionProductPublish', compact('products', 'sections'));
    }

    public function updateSectionProductStatus(Request $request)
    {
        $validated = $request->validate([
            'status' => 'required',
            'secId'  => 'required',
            'pid'    => 'required|integer'
        ]);
        try {
            $existCheck = SectionProduct::where('product_id', $request->pid)->where('section_id', $request->secId)->first();
            if ($existCheck) {
                if ($request->status == 'true') {
                    SectionProduct::where('product_id', $request->pid)->where('section_id', $request->secId)->update(['status' => 'active']);
                } else {
                    SectionProduct::where('product_id', $request->pid)->where('section_id', $request->secId)->update(['status' => 'inactive']);
                }
            } else {
                SectionProduct::create([
                    'product_id' => $request->pid,
                    'section_id' => $request->secId,
                    'status' => $request->status ? 'active' : 'inactive',
                ]);
            }

            return response()->json(['success' => true, 'message' => 'Status updated successfully']);
        } catch (\Throwable $th) {
            return response()->json(['success' => false, 'message' => 'Item not found'], 404);
        }
    }


    public function webrandcreate() {
        return view('admin.pages.werbrand.create') ;
    }
    public function webrandmanage() {
        $webrand = Webrand::all();
        return view('admin.pages.werbrand.manage',compact('webrand')) ;
    }

    public function webrandstore(Request $request) {

        $validated = $request->validate([
            'rdetails' => 'nullable',
            'img' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

        ]);


        $input = $request->all();

        if ($image = $request->file('img')) {
            $destinationPath = 'frontend/img/';
            $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
            $image->move($destinationPath, $profileImage);
            $input['img'] = "$profileImage";
        }


        Webrand::create($input);

        return redirect()->route('admin.webrandmanage')->with('success', 'brand created');
    }


    public function webrandedit($id) {
        $webrand = Webrand::findorfail($id);
        return view('admin.pages.werbrand.edit',compact('webrand')) ;
    }

    public function webrandupdate($id, Request $request) {

        $post = Webrand::findorfail($id);
        $validated = $request->validate([
            'rdetails' => 'nullable',
            'img' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',

        ]);


        $input = $request->all();

        if ($image = $request->file('img')) {
            $destinationPath = 'frontend/img/';
            $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
            $image->move($destinationPath, $profileImage);
            $input['img'] = "$profileImage";
        }else{
            unset($input['img']);
        }

        $post->update($input);

        return redirect()->route('admin.webrandmanage')->with('success', 'brand updated');
    }

    public function webranddelete($id) {
        $post = Webrand::findorfail($id);
        $post->delete();
        return redirect()->route('admin.webrandmanage')->with('success', 'brand deleted');
    }

    public function mapli() {
        $mapli = Mapli::first();
        return view('admin.pages.mapli.manage',compact('mapli')) ;
    }

    public function mapliedit($id) {
        $mapli = Mapli::findorfail($id);
        return view('admin.pages.mapli.edit',compact('mapli')) ;
    }

    public function mapliupdate($id, Request $request) {

        $post = Mapli::findorfail($id);
        $validated = $request->validate([
            'map' => 'required',
            'licence' => 'required',
        ]);

        $input = $request->all();

        $post->update($input);

        return redirect()->route('admin.mapli')->with('success', 'map and licence updated');
    }

    public function btob() {
        $btob = Btob::all();
        return view('admin.pages.btob.manage',compact('btob')) ;
    }

    public function btobcreate() {
        return view('admin.pages.btob.create') ;
    }

    public function btobstore(Request $request) {

        $validated = $request->validate([
            'details' => 'nullable',
        ]);


        $input = $request->all();

        Btob::create($input);

        return redirect()->route('admin.btob')->with('success', 'b 2 b created');
    }

    public function btobedit($id) {
        $btob = Btob::findorfail($id);
        return view('admin.pages.btob.edit',compact('btob')) ;
    }

    public function btobupdate($id, Request $request) {

        $post = Btob::findorfail($id);
        $validated = $request->validate([
            'details' => 'required',
        ]);

        $input = $request->all();

        $post->update($input);

        return redirect()->route('admin.btob')->with('success', 'B 2 B updated');
    }

    public function btobdelete($id) {
        $post = Btob::findorfail($id);
        $post->delete();
        return redirect()->route('admin.btob')->with('success', 'B 2 B deleted');
    }

    public function topmarmanage() {
        $topmar = Topmar::all();
        return view('admin.pages.topmar.manage',compact('topmar')) ;
    }

    public function topmaredit($id) {
        $topmar = Topmar::findorfail($id);
        return view('admin.pages.topmar.edit',compact('topmar')) ;
    }

    public function topmarupdate($id, Request $request) {

        $post = Topmar::findorfail($id);
        $validated = $request->validate([
            'details' => 'nullable',
        ]);

        $input = $request->all();

        $post->update($input);

        return redirect()->route('admin.topmarmanage')->with('success', 'Notification updated');
    }

    public function subscriber() {
        $post = Subscriber::all();
        return view('admin.pages.subscribers.index', compact('post'));
    }

    public function subscriberdelete($id) {
        $post = Subscriber::findorfail($id);
        $post->delete();
        return redirect()->route('admin.subscriber')->with('success', 'Subscriber deleted');
    }
}
