<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Color;
use App\Models\Product;
use App\Models\ProductStock;
use App\Models\Upload;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Laravel\Facades\Image;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\ImportExcel;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::withSum('orderDetails', 'quantity')
        ->orderBy('created_at', 'desc')
        ->get()
        ->map(function ($product) {
            // Apply discount calculation
            if ($product->discount_type === 'flat') {
                $product->main_price = $product->selling_price - $product->discount_price;
            } elseif ($product->discount_type === 'percent') {
                $product->main_price = $product->selling_price - ($product->selling_price * ($product->discount_price / 100));
            } else {
                $product->main_price = $product->selling_price; // No discount
            }

            // Calculate remaining stock
            $product->remaining_stock = $product->quantity - ($product->order_details_sum_quantity ?? 0);

            return $product;
        });

        return view('admin.pages.products.allproducts', compact('products'));
    }

    public function create()
    {
        $categories = Category::where('status', 'active')->get();
        $brands = Brand::where('status', 'active')->get();
        $colors = Color::where('status', 'active')->get();
        return view('admin.pages.products.addProduct', compact('categories', 'brands', 'colors'));
    }

    public function store(Request $request)
{
    $request->validate([
        'name'                  => 'required|string',
        'category'              => 'required',
        'brand'                 => 'nullable',
        'unit'                  => 'required',
        'minimum_purchase_qty'  => 'nullable',
        'thumbnail'             => 'required|image|max:15360',           // 15MB max
        'gallery_images'        => 'required|array|max:3',              // max 3 images
        // 'gallery_images.*'      => 'image|max:15360',                    // each image ≤ 15MB
        'gallery_images.*' => 'image|mimes:jpeg,png,jpg,webp|max:15360',
        'selling_price'         => 'required',
    ]);

    DB::beginTransaction();
    try {
        $upId = [];
        $gallery_images = [];

        $data = [
            'user_id'              => Auth::id(),
            'name'                 => $request->name,
            'slug'                 => Str::of($request->name)->slug('-'),
            'category_id'          => $request->category,
            'brand_id'             => $request->brand ?? '1',
            'model'                => $request->model ?? 'Desi Model',
            'unit'                 => $request->unit,
            'weight'               => $request->weight ?? 1,
            'minimum_purchase_qty' => $request->minimum_purchase_qty ?? '1',
            'color'                => is_array($request->color) && isset($request->color[0]) && $request->color[0] != null ? json_encode($request->color) : json_encode([]),
            'size'                 => is_array($request->size) && isset($request->size[0]) && $request->size[0] != null ? json_encode($request->size) : json_encode([]),
            'quantity'             => $request->quantity,
            'selling_price'        => $request->selling_price,
            'discount_from'        => $request->discount_from,
            'discount_to'          => $request->discount_to,
            'discount_price'       => $request->discount_price ?? '0',
            'discount_type'        => $request->discount_type ?? 'flat',
            'description'          => $request->description ?? 'No description found',
            'warranty'             => $request->warranty ?? null,
            'warranty_duration'    => $request->warranty_duration ?? null,
            'warranty_condition'   => $request->warranty_condition ?? null,
            'is_free_shipping'     => isset($request->is_free_shipping) ? $request->is_free_shipping : null,
            'show_stock_qty'       => isset($request->show_stock_qty) ? $request->show_stock_qty : null,
            'cash_on_delivery'     => isset($request->cash_on_delivery) ? $request->cash_on_delivery : null,
            'low_stock_qty'        => $request->low_stock_qty ?? '10',
            'estimate_shipping_day'=> $request->estimate_shipping_day ?? '5',
            'thumbnail'            => json_encode([]), // Will be replaced below
            'images'               => json_encode([]), // Will be replaced below
            'videoid'              => $request->videoid ?? null,
        ];

        // ✅ Upload thumbnail
        if ($request->file('thumbnail')) {
            $image = $request->file('thumbnail');
            $img = Image::read($image->getRealPath());
            $img->resize(300, 300);
            $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();
            $img->save(public_path('uploads/' . $imageName));

            $tupload = Upload::create([
                'file_name' => 'uploads/' . $imageName,
                'user_id'   => Auth::id(),
                'extension' => $image->getClientOriginalExtension(),
                'file_size' => $image->getSize() / 1024, // in KB
            ]);

            $upId[] = $tupload->id;
            $data['thumbnail'] = json_encode($upId);
        }

        // ✅ Upload gallery images
        if ($request->file('gallery_images')) {
            $images = $request->file('gallery_images');
            foreach ($images as $image) {
                $img = Image::read($image->getRealPath());
                $img->resize(600, 600);
                $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();
                $img->save(public_path('uploads/more/' . $imageName));

                $more_upload = Upload::create([
                    'file_name' => 'uploads/more/' . $imageName,
                    'user_id'   => Auth::id(),
                    'extension' => $image->getClientOriginalExtension(),
                    'file_size' => $image->getSize() / 1024, // in KB
                ]);

                $gallery_images[] = $more_upload->id;
            }
            $data['images'] = json_encode($gallery_images);
        } else {
            $data['images'] = json_encode([]);
        }

        // ✅ Save product
        $saveProduct = Product::create($data);

        // ✅ Save product stock (color/size/qty combo)
        $colors = is_array($request->color) ? $request->color : [];
        $sizes  = is_array($request->size) ? $request->size : [];
        $qtys   = is_array($request->qty) ? $request->qty : [];

        if (isset($colors[0], $sizes[0], $qtys[0]) && $colors[0] !== null && $sizes[0] !== null && $qtys[0] !== null) {
            foreach ($colors as $key => $color) {
                ProductStock::create([
                    'product_id' => $saveProduct->id,
                    'color_id'   => $color,
                    'size'       => $sizes[$key] ?? null,
                    'qty'        => $qtys[$key] ?? 0,
                    'price'      => $request->selling_price,
                ]);
            }
        }

        DB::commit();
        return redirect()->route('admin.product.create')->with('success', 'Product Added Successfully.');
    } catch (\Throwable $th) {
        DB::rollBack();
        \Log::error('Product creation failed: ' . $th->getMessage());
        return redirect()->back()->with('error', 'Something went wrong. Please try again.');
    }
}


    // public function store(Request $request){

    //     $request->validate([
    //         'name'                 => 'required|string',
    //         'category'             => 'required',
    //         'brand'                => 'nullable',
    //         'unit'                 => 'required',
    //         'minimum_purchase_qty' => 'nullable',
    //         'thumbnail'            => 'required|max:5120',
    //         // 'gallery_images'       => 'required|max:15360',
    //         // 'thumbnail'            => 'required|max:5120',
    //         // 'gallery_images'       => 'required|max:5120',
    //         'selling_price'        => 'required',
    //         'gallery_images' => 'required|array',
    //         'gallery_images.*' => 'file|max:15360', // applies 15 MB limit to each uploaded file

    //     ]);

    //     DB::beginTransaction();
    //     try {

    //         $data = [
    //             'user_id'              => Auth::id(),
    //             'name'                 => $request->name,
    //             'slug'                 => Str::of($request->name)->slug('-'),
    //             'category_id'          => $request->category,
    //             'brand_id'             => $request->brand ?? '1',
    //             // 'model'                => $request->model ?? null,
    //             'model'                => $request->model ?? 'Desi Model',
    //             'unit'                 => $request->unit,
    //             // 'weight'               => $request->weight,
    //             'weight'               => $request->weight ?? 1,
    //             'minimum_purchase_qty' => $request->minimum_purchase_qty ?? '1',
    //             // 'color'                => $request->color[0] != null ? json_encode($request->color) : [],
    //             'color'                => $request->color[0] != null ? json_encode($request->color) : json_encode([]),
    //             // 'size'                 => $request->size[0] != null ? json_encode($request->size) : [],
    //             'size'                 => $request->size[0] != null ? json_encode($request->size) : json_encode([]),
    //             'quantity'              => $request->quantity,
    //             'selling_price'         => $request->selling_price,
    //             'discount_from'         => $request->discount_from,
    //             'discount_to'           => $request->discount_to,
    //             'discount_price'        => $request->discount_price ?? '0',
    //             'discount_type'         => $request->discount_type ?? 'flat',
    //             'description'           => $request->description ?? 'No description found',
    //             'warranty'              => $request->warranty ?? null,
    //             'warranty_duration'     => $request->warranty_duration ?? null,
    //             'warranty_condition'    => $request->warranty_condition ?? null,
    //             'is_free_shipping'      => isset($request->is_free_shipping) ? $request->is_free_shipping : null,
    //             'show_stock_qty'        => isset($request->show_stock_qty) ? $request->show_stock_qty : null,
    //             'cash_on_delivery'      => isset($request->cash_on_delivery) ? $request->cash_on_delivery : null,
    //             'low_stock_qty'         => $request->low_stock_qty ?? '10',
    //             'estimate_shipping_day' => $request->estimate_shipping_day ?? '5',

    //             // newly added
    //             'thumbnail'            => json_encode($upId ?? []),
    //             'images'               => json_encode($gallery_images ?? []),
    //             'videoid'              => $request->videoid ?? null,
    //         ];


    //         if ($request->file('thumbnail')) {
    //             $image = $request->file('thumbnail');
    //             $img = Image::read($image->getRealPath());
    //             $img->resize(300, 300);
    //             $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

    //             $img->save(public_path('uploads/' . $imageName));

    //             $tupload = Upload::create([
    //                 'file_name' => 'uploads/' . $imageName,
    //                 'user_id' => Auth::id(),
    //                 'extension' => $image->getClientOriginalExtension(),
    //                 'file_size' => $image->getSize() / 1024,  //in kb
    //                 // 'file_size' => $image->getSize() / 5120,  //in kb
    //                 // 'type' => 'image',
    //             ]);

    //             $upId[] = $tupload->id;
    //             $data['thumbnail'] = json_encode($upId);
    //         }

    //         $gallery_images = [];
    //         if ($request->file('gallery_images')) {
    //             $images = $request->file('gallery_images');
    //             foreach ($images as $key => $image) {
    //                 $img = Image::read($image->getRealPath());
    //                 $img->resize(600, 600);
    //                 $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

    //                 $img->save(public_path('uploads/more/' . $imageName));
    //                 // array_push($gimages, $imageName);

    //               $more_upload = Upload::create([
    //                     'file_name' => 'uploads/more/' . $imageName,
    //                     'user_id' => Auth::id(),
    //                     'extension' => $image->getClientOriginalExtension(),
    //                     'file_size' => $image->getSize() / 1024,  //in kb
    //                 ]);


    //                 $gallery_images[] = $more_upload->id;
    //             }
    //             $data['images'] = json_encode($gallery_images);
    //         } else {
    //             $data['images'] = [];
    //         }

    //         // dd($saveProduct);

    //         $saveProduct = Product::create($data);

    //         $colors = $request->color;
    //         $sizes  = $request->size;
    //         $qtys   = $request->qty;

    //         if ($colors[0] != null && $sizes[0] != null && $qtys[0] != null) {
    //             foreach ($colors as $key => $color) {
    //                 ProductStock::create([
    //                     'product_id' => $saveProduct->id,
    //                     'color_id'   => $color,
    //                     'size'       => $sizes[$key],
    //                     'qty'        => $qtys[$key],
    //                     'price'      => $request->selling_price,
    //                 ]);
    //             }
    //         }




    //         DB::commit();

    //         return redirect()->route('admin.product.create')->with('success', 'Product Added Successfully.');
    //     } catch (\Throwable $th) {
    //         DB::rollBack();
    //         return $th->getMessage();
    //         return redirect()->back()->with('error', 'Somethng going wrong. try later.');
    //     }
    // }


    public function edit($id)
    {
        $data = Product::with('ProductStock')->find($id);
        $categories = Category::where('status', 'active')->get();
        $brands = Brand::where('status', 'active')->get();
        $colors = Color::where('status', 'active')->get();
        // dd($data->color);
        return view('admin.pages.products.editProduct', compact('categories', 'brands', 'colors', 'data'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name'                 => 'required|string',
            'category'             => 'required',
            'brand'                => 'required',
            'unit'                 => 'required',
            'minimum_purchase_qty' => 'required',
            'selling_price'        => 'required'
        ]);



        DB::beginTransaction();
        try {

            $updateData = Product::find($id);

            $removeImages = $request->input('remove_images', []);

            $images = json_decode($updateData->images);
            $updateImages = array_diff($images, $removeImages);

            $data = [
                'user_id'               => Auth::id(),
                'name'                  => $request->name,
                'slug'                  => Str::of($request->name)->slug('-'),
                'category_id'           => $request->category,
                'brand_id'              => $request->brand,
                'model'                 => $request->model != '' ? $request->model : null,
                'unit'                  => $request->unit,
                'weight'                => $request->weight,
                'minimum_purchase_qty'  => $request->minimum_purchase_qty,
                'color'                 => $request->color[0] != null ? json_encode($request->color) : [],
                'size'                  => $request->size[0] != null ? json_encode($request->size) : [],
                'quantity'              => $request->quantity,
                'selling_price'         => $request->selling_price,
                'discount_from'         => $request->discount_from,
                'discount_to'           => $request->discount_to,
                'discount_price'        => $request->discount_price,
                'discount_type'         => $request->discount_type,
                'description'           => $request->description,
                'warranty'              => $request->warranty,
                'warranty_duration'     => $request->warranty_duration,
                'warranty_condition'    => $request->warranty_condition,
                'is_free_shipping'      => isset($request->is_free_shipping) ? $request->is_free_shipping : null,
                'show_stock_qty'        => isset($request->show_stock_qty) ? $request->show_stock_qty : null,
                'cash_on_delivery'      => isset($request->cash_on_delivery) ? $request->cash_on_delivery : null,
                'low_stock_qty'         => $request->low_stock_qty,
                'estimate_shipping_day' => $request->estimate_shipping_day,
                'videoid'               => $request->videoid ?? null,
            ];

            if ($request->file('thumbnail')) {
                $image = $request->file('thumbnail');
                $img = Image::read($image->getRealPath());
                $img->resize(300, 300);
                $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

                $img->save(public_path('uploads/' . $imageName));

                $tupload = Upload::create([
                    'file_name' => 'uploads/' . $imageName,
                    'user_id' => Auth::id(),
                    'extension' => $image->getClientOriginalExtension(),
                    'file_size' => $image->getSize() / 1024,  //in kb
                    'type' => 'image',
                ]);

                $upId[] = $tupload->id;
                $data['thumbnail'] = json_encode($upId);
            }

            if ($request->file('gallery_images')) {
                $images = $request->file('gallery_images');
                foreach ($images as $key => $image) {
                    $img = Image::read($image->getRealPath());
                    $img->resize(600, 600);
                    $imageName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $image->getClientOriginalExtension();

                    $img->save(public_path('uploads/more/' . $imageName));
                    // array_push($gimages, $imageName);

                    $more_upload = Upload::create([
                        'file_name' => 'uploads/more/' . $imageName,
                        'user_id' => Auth::id(),
                        'extension' => $image->getClientOriginalExtension(),
                        'file_size' => $image->getSize() / 1024,  //in kb
                        'type' => 'image',
                    ]);

                    $updateImages[] = $more_upload->id;
                }
                $data['images'] = json_encode($updateImages);
            } else {
                $data['images'] = json_encode($updateImages);
            }

            $updateProduct = Product::where('id', $id)->update($data);

            //
            ProductStock::where('product_id', $id)->delete();  //delete old data
            // now updte product stock table
            $colors = $request->color;
            $sizes  = $request->size;
            $qtys   = $request->qty;


            if ($colors[0] != null && $sizes[0] != null && $qtys[0] != null) {
                foreach ($colors as $key => $color) {
                    ProductStock::create([
                        'product_id' => $id,
                        'color_id'   => $color,
                        'size'       => $sizes[$key],
                        'qty'        => $qtys[$key],
                        'price'      => $request->selling_price,
                    ]);
                }
            };

            DB::commit();

            // return redirect()->back()->with('success', 'Product Updated successfully.');
             return redirect()->route('admin.product.index')->with('success', 'Product Updated successfully.');
        } catch (\Throwable $th) {
            DB::rollBack();
            return $th->getMessage();
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }

    public function delete($id)
    {

        try {
            $product = Product::find($id)->delete();
            // if ($product) {
            //     Product::where('id', $id)->update(['status' => 'inactive']);
            //     Product::where('id', $id)->update(['status' => 'inactive']);
            // }

            return redirect()->route('admin.product.index')->with('success', 'Product deleted successfully.');
        } catch (\Throwable $th) {
            return redirect()->back()->with('error', 'Somethng going wrong. try later.');
        }
    }
    public function updateStatus(Request $request)
    {
        $validated = $request->validate([
            'status' => 'required',
            'id' => 'required|integer'
        ]);
        try {
            $product = Product::find($request->id);
            if ($product && $request->status == 'true') {
                Product::where('id', $request->id)->update(['status' => 'active']);
            } else {
                Product::where('id', $request->id)->update(['status' => 'inactive']);
            }

            return response()->json(['success' => true, 'message' => 'Status updated successfully']);
        } catch (\Throwable $th) {
            return response()->json(['success' => false, 'message' => 'Item not found'], 404);
        }
    }


    public function sellerProduct()
    {
        $products = Product::get();
        // $products = Product::where('status', 'active')->get();
        // $photos = Upload::all();
        return view('admin.pages.products.sellerproducts', compact('products'));
    }

    public function productReview(Request $request)
    {
        // $validated = $request->validate([
        //     'status' => 'required',
        //     'id' => 'required|integer'
        // ]);
        // try {
        //     $product = Product::find($request->id);
        //     if ($product && $request->status == 'true') {
        //         Product::where('id', $request->id)->update(['status' => 'active']);
        //     } else {
        //         Product::where('id', $request->id)->update(['status' => 'inactive']);
        //     }

        //     return response()->json(['success' => true, 'message' => 'Status updated successfully']);
        // } catch (\Throwable $th) {
        //     return response()->json(['success' => false, 'message' => 'Item not found'], 404);
        // }
    }

    public function gotoimportCSV()
    {
        return view ('admin.pages.importcsv.csv');
    }


    public function importCSV(Request $request)
    {
        Excel::import(new ImportExcel, $request->file('csv_file'));
        return back()->with('success', 'CSV data imported successfully.');
    }


    public function stockpriceedit()
    {
        $products = Product::withSum('orderDetails', 'quantity')
        ->orderBy('created_at', 'desc')
        ->get()
        ->map(function ($product) {
            $product->main_price = $product->selling_price; // No discount
            $product->remaining_stock = $product->quantity;

            return $product;
        });

        return view('admin.pages.products.stockpriceedit', compact('products'));
    }

    public function updateField($id, Request $request){

        $product = Product::findorfail($id);
        $validated = $request->validate([
            'selling_price' => 'required|max:25',
            'quantity' => 'required',

        ]);
        $input = $request->all();
        $product->update($input);

        return redirect()->route('admin.stockpriceedit');

    }













}
