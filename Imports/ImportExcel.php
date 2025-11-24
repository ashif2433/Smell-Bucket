<?php

namespace App\Imports;

use App\Models\Product;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\ToModel;

class ImportExcel implements ToCollection,ToModel
{

    private $num = 0;
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        // dd($collection);
    }

    public function model(array $row){
        $this->num ++;

        if($this->num >1 ){
            $product = new Product();
            $count = Product::where('name','=',$row[1])->count();
            if(empty($count)){
                $product->user_id = $row[0];
                $product->name = $row[1];
                $product->slug = $row[2];
                $product->category_id = $row[3];
                $product->brand_id = $row[4];
                $product->model = $row[5];
                $product->unit = $row[6];
                $product->weight = $row[7];
                $product->minimum_purchase_qty = $row[8];

                $product->buying_price = $row[9];

                $product->selling_price = $row[10];


                $product->discount_from = $row[11];
                $product->discount_to = $row[12];
                $product->discount_price = $row[13];

                $product->discount_type = $row[14];

                $product->quantity = $row[15];

                $product->sell_quantity = $row[16];

                $product->sku_code = $row[17];
                $product->color = $row[18];
                $product->size = $row[19];

                $product->thumbnail = $row[20];
                $product->images = $row[21];

                $product->warranty = $row[22];

                $product->warranty_duration = $row[23];
                $product->warranty_condition = $row[24];

                $product->description = $row[25];

                $product->is_free_shipping = $row[26];
                $product->show_stock_qty = $row[27];
                $product->cash_on_delivery = $row[28];

                $product->low_stock_qty = $row[29];
                $product->estimate_shipping_day = $row[30];

                $product->featured = $row[31];

                $product->status = $row[32];

                // dd($row);
                $product->save();
            }

            // dd($product);
        }

    }
}
