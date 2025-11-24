<?php

use App\Models\Administration\Category;
use App\Models\Color;
use App\Models\Product;
use App\Models\SectionProduct;
use App\Models\Upload;
use Carbon\Carbon;

function slugify($text)
{
    // replace non letter or digits by -
    $text = preg_replace('~[^\pL\d]+~u', '-', $text);

    // transliterate
    $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

    // remove unwanted characters
    $text = preg_replace('~[^-\w]+~', '', $text);

    // trim
    $text = trim($text, '-');

    // remove duplicate -
    $text = preg_replace('~-+~', '-', $text);

    // lowercase
    $text = strtolower($text);

    if (empty($text)) {
        return 'n-a';
    }
    return $text;
}

function setMessage($type, $message)
{
    session()->flash('type', $type);
    session()->flash('message', $message);
}

// function getCategory($categories, $level = "", $root_cat = "")
// {
//     $output = "";
//     foreach ($categories as $category) {
//         if ($category->id == $root_cat) {
//             $output .= '<option value = "' . $category->id . '" selected="">' . $category->name . '</option>';
//         } else {
//             $output .= '<option value = "' . $category->id . '">' . $category->name . '</option>';
//         }
//         if (count($category->sub_category)) {
//             foreach ($category->sub_category as $sub_cat) {
//                 if ($sub_cat->id == $root_cat) {
//                     $output .= '<option value="' . $sub_cat->id . '" selected="">' . $category->name . ' > ' . $sub_cat->name . '</option>';
//                 } else {
//                     $output .= '<option value="' . $sub_cat->id . '">' . $category->name . ' > ' . $sub_cat->name . '</option>';
//                 }
//                 if ($level == 3) {
//                     foreach ($sub_cat->sub_category as $sub_cat1) {
//                         if ($sub_cat1->id == $root_cat) {
//                             $output .= '<option value="' . $sub_cat1->id . '" selected="">' . $category->name . ' > ' . $sub_cat->name . ' > ' . $sub_cat1->name . '</option>';
//                         } else {
//                             $output .= '<option value="' . $sub_cat1->id . '">' . $category->name . ' > ' . $sub_cat->name . ' > ' . $sub_cat1->name . '</option>';
//                         }
//                     }
//                 }
//             }
//         }
//     }
//     return $output;
// }

// function getCategory($categories, $root_cat = "", $prefix = "") {
//     $output = "";
//     foreach ($categories as $category) {
//         $isSelected = ($category->id == $root_cat) ? ' selected=""' : '';
//         $output .= '<option value="' . $category->id . '"' . $isSelected . '>' . $prefix . $category->name . '</option>';

//         // If subcategories exist, recurse
//         if (!empty($category->sub_category)) {
//             $output .= getCategory($category->sub_category, $root_cat, $prefix . $category->name . ' > ');
//         }
//     }
//     return $output;
// }

function getCategory($categories, $root_cat = "", $prefix = "") {
    $output = "";

    foreach ($categories as $category) {
        $isSelected = ((string)$category->id === (string)$root_cat) ? ' selected="selected"' : '';
        $output .= '<option value="' . $category->id . '"' . $isSelected . '>' . $prefix . htmlspecialchars($category->name) . '</option>';

        if (!empty($category->sub_category)) {
            $output .= getCategory($category->sub_category, $root_cat, $prefix . $category->name . ' > ');
        }
    }

    return $output;
}



function color()
{
    return [
        'White' => 'White',
        'Black' => 'Black',
        'Yellow' => 'Yellow',
        'Blue' => 'Blue',
        'Red' => 'Red'
    ];
}

function colorCode($id)
{
    return optional(Color::find($id))->code;
}



function size()
{
    return [
        'SM' => 'SM',
        'M' => 'M',
        'L' => 'L',
        'XL' => 'XL',
        'XXL' => 'XXL'
    ];
}

function frontendCategories($categories)
{
    $output = "";
    // $output .= '<ul class="d-flex justify-content-center align-items-center" style="column-gap: 15px;">';
    $output .= '<ul class="menu menu-vertical sf-arrows px-2">';
    foreach ($categories as $key => $category) {

        if ($key == 0) {
            $output .= '<li><a href = "' . route('product.bycategory', $category->id) . '" class = "' . (count($category->sub_category) > 0 ? 'sf-with-ul px-2' : '').'">' . $category->name . '</a>';
            // $output .= '<li><a href = "' . route('product.bycategory', $category->slug) . '" class = "' . (count($category->sub_category) > 0 ? 'sf-with-ul' : '')  .  'p-2">' . $category->name . '</a>';
        } else {
            $output .= '<li><a href = "' . route('product.bycategory', $category->id) . '" class = "px-2">' . $category->name . '</a>';
            // $output .= '<li><a href = "' . route('product.bycategory', $category->slug) . '" class = "p-2">' . $category->name . '</a>';
        }
        // $output .= '<li><a href = "javascript:avoid(0)" class = "sf-with-ul p-2">' . $category->name . '</a>';


        //this is sub category from megamenu

        if (count($category->sub_category)) {
            $output .= '<ul>';
            foreach ($category->sub_category as $sub_cat) {
                // $output .= '<li><a class=" p-2" href = "' . route('product.bycategory', [$category->slug, 'subcategory', $sub_cat->slug]) . '">' . $sub_cat->name . '</a>';
                $output .= '<li><a class=" px-2" href = "' . route('product.bycategory', [$category->id, 'subcategory', $sub_cat->id]) . '">' . $sub_cat->name . '</a>';

                if (count($sub_cat->sub_category)) {
                    $output .= '<ul>';
                    foreach ($sub_cat->sub_category as $sub_cat1) {
                        // $output .= '<li><a class=" p-2" href = " ' . route('products', [$category->slug, $sub_cat->slug, $sub_cat1->slug]) . '">' . $sub_cat1->name . '</a>';
                        $output .= '<li><a class=" px-2" href = " ' . route('products', [$category->id, $sub_cat->id, $sub_cat1->slug]) . '">' . $sub_cat1->name . '</a>';
                        $output .= '</li>';
                    }
                    $output .= '</ul>';
                }

                $output .= '</li>';
            }
            $output .= '</ul>';
        }

        $output .= '</li>';
    }
    $output .= '</ul>';
    return $output;
}

function searchCategories($categories)
{
    $output = "";
    foreach ($categories as $category) {
        $output .= '<option value="">' . $category->name;
    }
    $output .= '</option>';
    return $output;
}


function thumbnail()
{
    return [
        'Samsung_Galaxy_A12.jpg' => 'Samsung_Galaxy_A12.jpg',
        'Samsung_Galaxy_A20.jpg' => 'Samsung_Galaxy_A20.jpg',
        'Samsung_Galaxy_A21s.jpg' => 'Samsung_Galaxy_A21s.jpg',
        'Samsung_Galaxy_M01_Core.jpg' => 'Samsung_Galaxy_M01_Core.jpg',
        'Samsung_Galaxy_M02.jpg' => 'Samsung_Galaxy_M02.jpg',
        'Samsung_Galaxy_M02s.jpg' => 'Samsung_Galaxy_M02s.jpg',
        'Samsung_Galaxy_M40.jpg' => 'Samsung_Galaxy_M40.jpg',
        'Samsung_Galaxy_Note8.jpg' => 'Samsung_Galaxy_Note8.jpg',
        'Samsung_Galaxy_M02.jpg' => 'Samsung_Galaxy_M02.jpg',
        'Samsung_Galaxy_M21.jpg' => 'Samsung_Galaxy_M21.jpg',
        'Xiaomi_Poco_C3.jpg' => 'Xiaomi_Poco_C3.jpg',
        'Xiaomi_Poco_M2.jpg' => 'Xiaomi_Poco_M2.jpg',
        'Xiaomi_Poco_M3.jpg' => 'Xiaomi_Poco_M3.jpg',
        'Xiaomi_Redmi_Note_9_Pro.jpg' => 'Xiaomi_Redmi_Note_9_Pro.jpg',
        'Xiaomi_Redmi_Note_9.jpg' => 'Xiaomi_Redmi_Note_9.jpg',

    ];
}
function images()
{
    return [
        'images_01.jpg'  => 'images_01.jpg',
        'images_02.jpg'  => 'images_02.jpg',
        'images_03.jpg'  => 'images_03.jpg',
        'images_04.jpg'  => 'images_04.jpg',
        'images_05.jpg'  => 'images_05.jpg',
        'images_06.jpg'  => 'images_06.jpg',
        'images_07.jpg'  => 'images_07.jpg',
        'images_08.jpg'  => 'images_08.jpg',
    ];
}


function headerCategories($categories)
{
    $output = "";
    $output .= '<ul>';
    foreach ($categories as $category) {
        $output .= '<li><a href="' . route('product.bycategory', $category->id) . '">' . $category->name . '</a>';
        // $output .= '<li><a href="' . route('product.bycategory', $category->slug) . '">' . $category->name . '</a>';

        if (count($category->sub_category)) {
            $output .= '<ul>';
            foreach ($category->sub_category as $sub_cat) {
                $output .= '<li><a href = "' . route('product.bycategory', [$category->id, 'subcategory', $sub_cat->id]) . '">' . $sub_cat->name . '</a>';
                // $output .= '<li><a href = "' . route('product.bycategory', [$category->slug, 'subcategory', $sub_cat->slug]) . '">' . $sub_cat->name . '</a>';

                if (count($sub_cat->sub_category)) {
                    $output .= '<ul>';
                    foreach ($sub_cat->sub_category as $sub_cat1) {
                        $output .= '<li><a href = " ' . route('products', [$category->id, $sub_cat->id, $sub_cat1->id]) . '">' . $sub_cat1->name . '</a>';
                        // $output .= '<li><a href = " ' . route('products', [$category->slug, $sub_cat->slug, $sub_cat1->slug]) . '">' . $sub_cat1->name . '</a>';
                        $output .= '</li>';
                    }
                    $output .= '</ul>';
                }

                $output .= '</li>';
            }
            $output .= '</ul>';
        }

        $output .= '</li>';
    }
    $output .= '</ul>';
    return $output;
}

//main
// function singlePhoto(array $data = [])
// {
//     // new
//     if (empty($data)) {
//         return '/';
//     }

//     $id = implode(',', $data);
//     $path = Upload::find($id);

//     if ($path) {
//         return '/' . $path->file_name;
//     } else {
//         return '/';
//     }
// }


//new
function singlePhoto(array $data = [])
{
    // If $data is empty or contains NULL, return a default image
    if (empty($data) || $data[0] === null) {
        return asset('default-image.jpg'); // Default image
    }

    // Otherwise, process the data
    $id = implode(',', $data);
    $path = Upload::find($id);

    if ($path) {
        return '/' . $path->file_name;
    } else {
        return asset('default-image.jpg'); // Fallback if no file is found
    }
}



function getSectionProductStatus($secid, $produuctid)
{
    $existCheck = SectionProduct::where('product_id', $produuctid)->where('section_id', $secid)->first();
    if ($existCheck && $existCheck->status == 'active') {
        return 'checked';
    }

    return '';
}



function getAnyColor($index) {
    // List of available colors
    $colors = ['#f9dcd9', '#fff8f8', '#f9f8d9', '#d5efe3', '#f2e1d6', '#e9c4cc', '#b5cda9', '#cdc9a9'];

    // If the index exceeds the array length, return a default color
    return $colors[$index % count($colors)] ?? '#000000'; // Fallback to black if the index is invalid
}

// function productPrice($id)
// {
//     $product = Product::find($id);
//     $price = 0;
//     if ($product->discount_price > 0) {
//         if ($product->discount_from <= date('Y-m-d H:i:s') && date('Y-m-d H:i:s') <= $product->discount_to) {
//             if ($product->discount_type == 'flat') {
//                 $price = $product->selling_price - $product->discount_price;
//             } else {
//                 $price = $product->selling_price - (($product->discount_price * $product->selling_price) / 100);
//             }
//         } else {
//             $price = $product->selling_price;
//         }
//     } else {
//         $price = $product->selling_price;
//     }
//     return $price;
// }



function productPrice($id)
{
    $product = Product::find($id);
    $price = 0;

    // Ensure the dates are Carbon instances for comparison
    $now = Carbon::now(); // Get the current time
    $discount_from = Carbon::parse($product->discount_from);
    $discount_to = Carbon::parse($product->discount_to);

    if ($product->discount_price > 0) {
        if ($discount_from <= $now && $now <= $discount_to) {
            if ($product->discount_type == 'flat') {
                $price = $product->selling_price - $product->discount_price;
            } else {
                $price = $product->selling_price - (($product->discount_price * $product->selling_price) / 100);
            }
        } else {
            $price = $product->selling_price;
        }
    } else {
        $price = $product->selling_price;
    }

    return $price;
}





function productDiscount($id)
{
    $product = Product::find($id);
    $discount = 0;
    if ($product->discount_price > 0) {
        if ($product->discount_from <= date('Y-m-d H:i:s') && date('Y-m-d H:i:s') <= $product->discount_to) {
            if ($product->discount_type == 'flat') {
                $discount = $product->discount_price;
            } else {
                $discount = ($product->selling_price * $product->discount_price) / 100;
            }
        } else {
            $discount = 0;
        }
    } else {
        $discount = 0;
    }
    return $discount;
}
