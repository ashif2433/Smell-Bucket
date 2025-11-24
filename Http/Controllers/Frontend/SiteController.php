<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\Review;
use App\Http\Controllers\Controller;
use App\Models\SingleBanner;
use App\Models\ClientReview;
use App\Models\Banner;
use App\Models\Webrand;
use App\Models\Btob;
use App\Models\HomeSlider;
use App\Models\Subscriber;
use App\Models\Section;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;


class SiteController extends Controller
{
    public function index()
    {

        $webrand = Webrand::all();

        $sections = Section::where('status', 'active')
            ->where('title', 'scroll')
            ->with(['SectionProduct' => function ($query) {
                $query->where('status', 'active')
                    ->orderBy('updated_at', 'desc'); // Order within the relationship query
            }])
            ->get();

        $sections->each(function ($item) {
            // Ensure the relationship is loaded before accessing it
            // $item->products = Product::whereIn('id', $item->SectionProduct->pluck('product_id'))
            //     ->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price', 'discount_from', 'discount_to', 'discount_type')
            //     ->get();

            $item->products = Product::whereIn('id', $item->SectionProduct->pluck('product_id'))
            ->withSum('orderDetails', 'quantity')
            // ->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price', 'discount_from', 'discount_to', 'discount_type',)
            ->get()
            ->map(function ($product) {
                // dd($product->order_details_sum_quantity, $product->name);
                $totalSold = $product->order_details_sum_quantity ?? 0;

                if ($totalSold > 300) {
                    $product->rating = 5;
                } elseif ($totalSold > 100) {
                    $product->rating = 4;
                } elseif ($totalSold > 50) {
                    $product->rating = 3;
                } elseif ($totalSold > 0) {
                    $product->rating = 2;
                } else {
                    $product->rating = 1;
                }

                return $product;
            });

            // dd($item);


        });

        $creviews = ClientReview::where('status', 'active')->latest()->get();

        $sectionsNew = Section::where('status', 'active')
            ->where('title', 'new_arrival')
            ->with(['SectionProduct' => function ($query) {
                $query->where('status', 'active')
                    ->orderBy('id', 'desc'); // Order within the relationship query
            }])
            ->get();


        $sectionsNew->each(function ($item) {
            // Ensure the relationship is loaded before accessing it
            // $item->products = Product::whereIn('id', $item->SectionProduct->pluck('product_id'))
            //     ->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price', 'discount_from', 'discount_to', 'discount_type')
            //     ->get();

            $item->products = Product::whereIn('id', $item->SectionProduct->pluck('product_id'))
            ->withSum('orderDetails', 'quantity')
            // ->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price', 'discount_from', 'discount_to', 'discount_type')
            ->get()
            ->map(function ($product) {
                $totalSold = $product->order_details_sum_quantity ?? 0;

                if ($totalSold > 300) {
                    $product->rating = 5;
                } elseif ($totalSold > 100) {
                    $product->rating = 4;
                } elseif ($totalSold > 50) {
                    $product->rating = 3;
                } elseif ($totalSold > 0) {
                    $product->rating = 2;
                } else {
                    $product->rating = 1;
                }

                return $product;
            });

        });

        $sliders = HomeSlider::where('status', 'active')->orderBy('serial')->get();
        // $banners = Banner::where('status', 'active')->orderBy('serial')->take(6)->get();
        $banners = Banner::where('status', 'active')
    ->orderBy('created_at', 'desc')
    ->take(6)
    ->get();

        // $categories = Category::where('status', 'active')
        //     ->where('home_category', 'active')
        //     ->get();

        // $categories = Category::where('status', 'active')
        // ->where('home_category', 'active')
        // ->withCount('products') // This will add products_count to each category
        // ->latest()
        // ->take(20) // Limit to 20 categories
        // ->get();
        $categories = Category::where('status', 'active')
        ->withCount('products') // Adds products_count to each category
        ->orderBy('products_count', 'desc') // More products first
        ->get();



        $menu = Category::where('status', 'active')
        ->take(8)
        ->get();


        $singleBanner = SingleBanner::where('status', 'active')->latest()->first();
        $singleCard = Section::where('status', 'active')
            ->where('title', 'single_card')
            ->latest()
            ->first()->SectionProduct->pluck('product_id');
        $singleCardProduct = Product::whereIn('id', $singleCard)->first();

        // $featured   = product::select('id', 'name', 'slug', 'selling_price', 'special_price', 'special_price_from', 'special_price_to', 'thumbnail')->where('featured', 1)->active()->get();
        return view('frontend.index', compact('sections', 'sectionsNew', 'sliders', 'banners', 'categories', 'singleBanner', 'singleCardProduct','menu','creviews','webrand'));
    }


    public function layoutpass()
{
    $menu = Category::where('status', 'active')->take(8)->get();

    return view('frontend.components.layout', compact('menu'));
}


    // public function products($id, $id, $id = null)
    public function products($slug1, $slug2, $slug3 = null)
    {
        if ($slug3) {
            $category = Category::where('slug', $slug3)->pluck('id');

            $categories = Category::with('productCount')->where('id', $category)->where('status', 'active')->get();
            $products   = Product::where('category_id', $category)->active()->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price')->get();
            $brand      = $products->pluck('brand_id')->unique();
            $brands     = Brand::select('id', 'name', 'slug')
                ->whereIn('id', $brand)->where('status', 'active')
                ->get()
                ->map(function ($brand) use ($products) {
                    $brand->products = $products->where('brand_id', $brand->id);

                    return $brand;
                });
        } else {
            $category     = Category::where('slug', $slug2)->pluck('id');
            $categories   = Category::with('productCount')->where('root', $category)->get();
            $category_ids = $categories->pluck('id');
            $products     = Product::whereIn('category_id', collect($category)->merge(collect($category_ids)))
                ->active()->orderBy('id', 'Desc')->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price')->get();
            $brand        = $products->pluck('brand_id')->unique();
            // $brands       = Brand::with('countProducts')
            //     ->select('id', 'name', 'slug')
            //     ->whereIn('id', $brand)
            //     ->where('status', 'active')
            //     ->get();

            $brands       = Brand::select('id', 'name', 'slug')
                ->whereIn('id', $brand)
                ->where('status', 'active')
                ->get()
                ->map(function ($brand) use ($products) {
                    $brand->products = $products->where('brand_id', $brand->id);

                    return $brand;
                });
        }
        // return $brands;
        $featured   = product::where('featured', 1)->active()->get();
        $topmenucat = Category::where('root', Category::categoryRoot)->get();

        // return view('frontend.products', compact('brands', 'categories', 'featured', 'category'));
        return view('frontend.products', compact('products', 'brands', 'categories', 'featured', 'topmenucat'));
    }



//     public function product($id)
// {
//     $product = Product::withSum('orderDetails', 'quantity')->where('id', $id)->first();

//     if (!$product) {
//         return abort(404, 'Product not found');
//     }

//     // Calculate the main price based on discount type
//     if ($product->discount_type === 'flat') {
//         $product->main_price = $product->selling_price - $product->discount_price;
//     } elseif ($product->discount_type === 'percent') {
//         $product->main_price = $product->selling_price - ($product->selling_price * ($product->discount_price / 100));
//     } else {
//         $product->main_price = $product->selling_price;
//     }

//     // Calculate remaining stock
//     $product->remaining_stock = $product->quantity - ($product->order_details_sum_quantity ?? 0);

//     // Calculate the rating based on total sold quantity
//     $totalSold = $product->order_details_sum_quantity ?? 0;

//     if ($totalSold > 300) {
//         $product->rating = 5;
//     } elseif ($totalSold > 100) {
//         $product->rating = 4;
//     } elseif ($totalSold > 50) {
//         $product->rating = 3;
//     } elseif ($totalSold > 0) {
//         $product->rating = 2;
//     } else {
//         $product->rating = 1;
//     }

//     // Fetch related products
//     $related_product = Product::where('category_id', $product->category_id)->pluck('category_id')->unique();
//     $relproducts = Product::where('category_id', $related_product)
//         ->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price')
//         ->get();

//     // Decode images and thumbnails
//     $thumbnail = json_decode($product->thumbnail);
//     $images = json_decode($product->images);

//     return view('frontend.product', compact('product', 'relproducts', 'images'));
// }


public function product($id)
{
    $product = Product::withSum('orderDetails', 'quantity')->where('id', $id)->first();

    if (!$product) {
        return abort(404, 'Product not found');
    }

    // Calculate the main price based on discount type
    if ($product->discount_type === 'flat') {
        $product->main_price = $product->selling_price - $product->discount_price;
    } elseif ($product->discount_type === 'percent') {
        $product->main_price = $product->selling_price - ($product->selling_price * ($product->discount_price / 100));
    } else {
        $product->main_price = $product->selling_price;
    }

    // Calculate remaining stock
    $product->remaining_stock = $product->quantity - ($product->order_details_sum_quantity ?? 0);

    // Calculate the rating based on total sold quantity
    $totalSold = $product->order_details_sum_quantity ?? 0;

    if ($totalSold > 300) {
        $product->rating = 5;
    } elseif ($totalSold > 100) {
        $product->rating = 4;
    } elseif ($totalSold > 50) {
        $product->rating = 3;
    } elseif ($totalSold > 0) {
        $product->rating = 2;
    } else {
        $product->rating = 1;
    }

    // Fetch related products with the same category, excluding the current product
    $relproducts = Product::where('category_id', $product->category_id)
        ->where('id', '!=', $product->id)
        ->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price')
        ->get();

    // Decode images and thumbnails safely
    $thumbnail = $product->thumbnail ? json_decode($product->thumbnail) : null;
    $images = $product->images ? json_decode($product->images) : null;

    // dd($product->color);
    return view('frontend.product', compact('product', 'relproducts', 'images'));
}




        // public function productByCategory($id, $id2 = null, $id3 = null)
        // // public function productByCategory($id, $slug2 = null, $slug3 = null)
        // {
        //     $category = Category::where('id', $id)->first();
        //     // $category = Category::where('slug', $slug)->first();
        //     if (!$category) {
        //         abort(404); // Return 404 if category not found
        //     }

        //     $categories = Category::where('root', $category->id)->get();
        //     $category_ids = $categories->pluck('id')->push($category->id);

        //     $productsQuery = Product::whereIn('category_id', $category_ids)
        //         ->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price', 'discount_from', 'discount_to', 'discount_type', 'category_id', 'brand_id', 'size');


        //     // dd($productsQuery);

        //     if ($id2 == 'subcategory' && $id3 != null) {
        //     // if ($slug2 == 'subcategory' && $slug3 != null) {
        //         $subcategory = Category::where('id', $id3)->first();
        //         // $subcategory = Category::where('slug', $slug3)->first();
        //         if ($subcategory) {
        //             $productsQuery->where('category_id', $subcategory->id);
        //         }
        //     }

        //     if ($id2 == 'brand' && $id3 != null) {
        //     // if ($slug2 == 'brand' && $slug3 != null) {
        //         $brand = Brand::where('id', $id3)->first();
        //         // $brand = Brand::where('slug', $slug3)->first();
        //         if ($brand) {
        //             $productsQuery->where('brand_id', $brand->id);
        //         }
        //     }

        //     if ($id2 == 'size' && $id3 != null) {
        //     // if ($slug2 == 'size' && $slug3 != null) {
        //         $productsQuery->whereJsonContains('size', $id3);
        //     }

        //     $products = $productsQuery->paginate(20);

        //     $brands = Brand::whereIn('id', $products->pluck('brand_id')->unique())
        //         ->where('status', 'active')
        //         ->get();

        //     $sizes = collect($products->pluck('size'))
        //         ->map(fn($item) => json_decode($item, true))
        //         ->flatten()
        //         ->unique()
        //         ->values()
        //         ->all();


        //         // dd($products->thumbnail);


        //     return view('frontend.productbycategory', compact('products', 'categories', 'brands', 'sizes', 'id', 'id2'));
        //     // return view('frontend.productbycategory', compact('products', 'categories', 'brands', 'sizes', 'slug', 'slug2'));
        // }


        //original
        // public function productByCategory($id, $id2 = null, $id3 = null){

        //     $category = Category::where('id', $id)->first();
        //     if (!$category) {
        //         abort(404); // Return 404 if category not found
        //     }

        //     $categories = Category::where('root', $category->id)->get();
        //     $category_ids = $categories->pluck('id')->push($category->id);

        //     $productsQuery = Product::whereIn('category_id', $category_ids)
        //         ->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price', 'discount_from', 'discount_to', 'discount_type', 'category_id', 'brand_id', 'size')
        //         ->withSum('orderDetails', 'quantity'); // Include sum of order details (sold quantity)

        //     // Subcategory filtering
        //     if ($id2 == 'subcategory' && $id3 != null) {
        //         $subcategory = Category::where('id', $id3)->first();
        //         if ($subcategory) {
        //             $productsQuery->where('category_id', $subcategory->id);
        //         }
        //     }

        //     // Brand filtering
        //     if ($id2 == 'brand' && $id3 != null) {
        //         $brand = Brand::where('id', $id3)->first();
        //         if ($brand) {
        //             $productsQuery->where('brand_id', $brand->id);
        //         }
        //     }

        //     // Size filtering
        //     if ($id2 == 'size' && $id3 != null) {
        //         $productsQuery->whereJsonContains('size', $id3);
        //     }

        //     // Fetch products and paginate
        //     $products = $productsQuery->paginate(20);

        //     // Map to calculate rating
        //     $products->getCollection()->transform(function ($product) {
        //         $totalSold = $product->order_details_sum_quantity ?? 0; // Get sold quantity (if exists)
        //         // dd($product->order_details_sum_quantity);
        //         // Calculate the rating based on total sold
        //         if ($totalSold > 300) {
        //             $product->rating = 5;
        //         } elseif ($totalSold > 100) {
        //             $product->rating = 4;
        //         } elseif ($totalSold > 50) {
        //             $product->rating = 3;
        //         } elseif ($totalSold > 0) {
        //             $product->rating = 2;
        //         } else {
        //             $product->rating = 1;
        //         }

        //         return $product;
        //     });

        //     $brands = Brand::whereIn('id', $products->pluck('brand_id')->unique())
        //         ->where('status', 'active')
        //         ->get();

        //     $sizes = collect($products->pluck('size'))
        //         ->map(fn($item) => json_decode($item, true))
        //         ->flatten()
        //         ->unique()
        //         ->values()
        //         ->all();

        //         $menu = Category::where('status', 'active')
        //         ->withCount('products') // Adds products_count to each category
        //         ->orderBy('products_count', 'desc') // More products first
        //         ->take(5)
        //         ->get();

        //     return view('frontend.productbycategory', compact('products', 'categories', 'brands', 'sizes', 'id', 'id2','menu'));
        // }


        //new
        // use Illuminate\Http\Request;

        public function productByCategory(Request $request, $id, $id2 = null, $id3 = null)
        {
            $category = Category::find($id);
            if (!$category) {
                abort(404);
            }

            $categories = Category::where('root', $category->id)->get();
            $category_ids = $categories->pluck('id')->push($category->id);

            $productsQuery = Product::whereIn('category_id', $category_ids)
                ->select('id', 'name', 'slug', 'thumbnail', 'selling_price', 'discount_price', 'discount_from', 'discount_to', 'discount_type', 'category_id', 'brand_id', 'size')
                ->withSum('orderDetails', 'quantity');

            // Subcategory filtering
            if ($id2 === 'subcategory' && $id3) {
                $subcategory = Category::find($id3);
                if ($subcategory) {
                    $productsQuery->where('category_id', $subcategory->id);
                }
            }

            // Brand filtering
            if ($id2 === 'brand' && $id3) {
                $brand = Brand::find($id3);
                if ($brand) {
                    $productsQuery->where('brand_id', $brand->id);
                }
            }

            // Size filtering
            if ($id2 === 'size' && $id3) {
                $productsQuery->whereJsonContains('size', $id3);
            }

            // ✅ Price filtering based on final price
            if ($request->filled('min_price') || $request->filled('max_price')) {
                $min = $request->min_price ?? 0;
                $max = $request->max_price ?? 1000000;

                $productsQuery->whereRaw('
                    (
                        CASE
                            WHEN discount_price > 0 AND selling_price > discount_price
                            THEN (selling_price - discount_price)
                            ELSE selling_price
                        END
                    ) BETWEEN ? AND ?
                ', [$min, $max]);
            }

            // Get paginated products
            $products = $productsQuery->paginate(20)->withQueryString();

            // Add rating & final_price
            $products->getCollection()->transform(function ($product) {
                $totalSold = $product->order_details_sum_quantity ?? 0;
                $product->rating = match (true) {
                    $totalSold > 300 => 5,
                    $totalSold > 100 => 4,
                    $totalSold > 50 => 3,
                    $totalSold > 0 => 2,
                    default => 1,
                };

                // Final price (for display)
                $product->final_price = ($product->discount_price > 0 && $product->selling_price > $product->discount_price)
                    ? $product->selling_price - $product->discount_price
                    : $product->selling_price;

                return $product;
            });

            $brands = Brand::whereIn('id', $products->pluck('brand_id')->unique())
                ->where('status', 'active')
                ->get();

            $sizes = collect($products->pluck('size'))
                ->map(fn($item) => json_decode($item, true))
                ->flatten()
                ->unique()
                ->values()
                ->all();

            $menu = Category::where('status', 'active')
                ->withCount('products')
                ->orderBy('products_count', 'desc')
                ->take(5)
                ->get();

            return view('frontend.productbycategory', compact(
                'products', 'categories', 'brands', 'sizes', 'id', 'id2', 'menu'
            ));
        }










    public function product_review(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'id' => 'required',
            'rating' => 'required|in:1,2,3,4,5',
            'message' => 'required',
        ]);

        //review collect.
        $review_exist = Review::where('customer_id', session('customer_id'))
            ->where('product_id', $request->id)->first();
        if ($review_exist) {
            return response()->json([
                'status' => 0,
                'message' => 'Duplicate Review Found!',
            ]);
        } else {

            try {
                Review::create([
                    'product_id'     => $request->id,
                    'customer_id'    => session('customer_id'),
                    'rating'         => $request->rating,
                    'product_review' => $request->message
                ]);
                return response()->json([
                    'status' => 1,
                    'message' => 'The product Review successfuly Submited',
                ]);
            } catch (Exception $e) {
                return response()->json([
                    'status' => 0,
                    'message' => $e->getMessage()
                ]);
            }
        }
    }

    public function product_review_reload(Request $request)
    {

        $product_id = $request->id;
        //review collect.
        $reviews = Review::with('customer')
            ->where('product_id', $product_id)->orderBy('id', 'desc')->get();

        return view('frontend.customer.reload-review', compact('reviews'));
    }



    public function productquickview($slug)
    {

        $product = Product::where('slug', $slug)->first();

        // marge thumbnail and images
        $thumbnail = $product->thumbnail;
        $images    = json_decode($product->images);
        $image2    = array_unshift($images, $thumbnail);  //insert the thumbnail in the first position

        return view('frontend.ajax.productquickview', compact('product', 'images'));
    }

    public function loadmore(Request $request)
    {
        if ($request->ajax()) {
            if ($request->id) {
                $category     = $request->cat_id;
                $categories   = Category::with('productCount')->where('root', $category)->get();
                $category_ids = $categories->pluck('id');
                $loadproducts = Product::where('id', '<', $request->id)->whereIn('category_id', collect($category)->merge(collect($category_ids)))
                    ->active()->orderBy('id', 'Desc')->limit(8)->get();
            } else {
                $category     = $request->cat_id;
                $categories   = Category::with('productCount')->where('root', $category)->get();
                $category_ids = $categories->pluck('id');
                $loadproducts = Product::whereIn('category_id', collect($category)->merge(collect($category_ids)))
                    ->active()->orderBy('id', 'Desc')->limit(16)->get();
            }
            return view('frontend.loadmoredata', compact('loadproducts'));
        }
    }



    public function pall(){

            Artisan::call('down');
            return ('now down');

    }


    public function product_search_ajax(Request $request)
    {
        $products = Product::where('name', 'like', '%' . $request->searchText . '%')->take(10)->get();
        return $products;
    }

    public function product_search(Request $request)
    {
        $request->validate([
            'search_text' => 'required'
        ]);

        $products = Product::where('name', 'like', '%' . $request->search_text . '%')->paginate(16);
        $products->appends($request->all());

        $menu = Category::where('status', 'active')
        ->withCount('products')
        ->orderBy('products_count', 'desc')
        ->take(5)
        ->get();
        return view('frontend.searchproducts', compact('products','menu'));
    }

    public function filter(Request $request){


        $menu = Category::where('status', 'active')
        ->withCount('products') // Adds products_count to each category
        ->orderBy('products_count', 'desc') // More products first
        ->take(5)
        ->get();


        $query = Product::query();

        if ($request->filled('min_price')) {
            $query->where('selling_price', '>=', $request->min_price);
        }

        if ($request->filled('max_price')) {
            $query->where('selling_price', '<=', $request->max_price);
        }

        $products = $query->latest()->paginate(12);

        return view('frontend.productbycategory', compact('products','menu'));
    }


    public function subscriberstore(Request $request) {

        $validated = $request->validate([
            'email' => 'required',
        ]);

        $input = $request->all();
        Subscriber::create($input);

        return redirect()->route('index');
    }



}
