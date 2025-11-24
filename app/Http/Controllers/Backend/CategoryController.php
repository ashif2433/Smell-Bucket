<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Laravel\Facades\Image;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::latest()->get();
        return view('admin.pages.administration.category.index', compact('categories'));
    }

    public function create()
    {
        $categories = Category::all();
        return view('admin.pages.administration.category.addCategory', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'root'   => 'required|string|max:255',
            'name'   => 'required|string|max:255|unique:categories,name',
            'image'  => 'nullable|image|mimes:jpeg,png,jpg,webp|max:4096',
            'status' => 'required|string'
        ]);

        // Handle Image Upload
        $imagePath = null;
        if ($request->hasFile('image')) {

            $image       = $request->file('image');
            $imageName   = time() . '_' . rand(10000, 99999) . '.' . $image->getClientOriginalExtension();

            $resizedImg  = Image::read($image->getRealPath())->resize(300, 300);
            $resizedImg->save(public_path('uploads/' . $imageName));

            $imagePath = 'uploads/' . $imageName;
        }

        // Create Category
        Category::create([
            'root'      => $request->root,
            'name'      => $request->name,
            'slug'      => slugify($request->name),
            'image'     => $imagePath,
            'status'    => $request->status,
            'create_by' => Auth::id(),
        ]);

        return redirect()->route('admin.category.index')
            ->with('success', 'Category created successfully.');
    }


    public function edit($id)
    {
        $data = Category::findOrFail($id);
        $categories = Category::all();

        return view('admin.pages.administration.category.updateCategory', compact('data', 'categories'));
    }


    public function update(Request $request, $id)
    {
        $item = Category::findOrFail($id);

        $request->validate([
            'root'   => 'required|string|max:255',
            'name'   => 'required|string|max:255|unique:categories,name,' . $id,
            'image'  => 'nullable|image|mimes:jpeg,png,jpg,webp|max:4096',
            'status' => 'required|string'
        ]);

        // Handle image update
        if ($request->hasFile('image')) {

            // delete previous image
            if ($item->image && file_exists(public_path($item->image))) {
                unlink(public_path($item->image));
            }

            $image      = $request->file('image');
            $imageName  = time() . '_' . rand(10000, 99999) . '.' . $image->getClientOriginalExtension();

            $resizedImg = Image::read($image->getRealPath())->resize(300, 300);
            $resizedImg->save(public_path('uploads/' . $imageName));

            $item->image = 'uploads/' . $imageName;
        }

        // Update fields
        $item->root      = $request->root;
        $item->name      = $request->name;
        $item->slug      = slugify($request->name);
        $item->status    = $request->status;
        $item->create_by = Auth::id();
        $item->save();

        return redirect()->route('admin.category.index')
            ->with('success', 'Category updated successfully.');
    }


    public function delete($id)
    {
        $item = Category::findOrFail($id);

        // delete image from server
        if ($item->image && file_exists(public_path($item->image))) {
            unlink(public_path($item->image));
        }

        $item->delete();

        return redirect()->route('admin.category.index')
            ->with('success', 'Category deleted successfully.');
    }


    public function updateCategoryStatus(Request $request)
    {
        $request->validate([
            'status' => 'required',
            'id'     => 'required|integer'
        ]);

        $category = Category::find($request->id);

        if (!$category) {
            return response()->json(['success' => false, 'message' => 'Category not found'], 404);
        }

        $category->home_category = $request->status === 'true' ? 'active' : 'inactive';
        $category->save();

        return response()->json(['success' => true, 'message' => 'Status updated successfully']);
    }
}
