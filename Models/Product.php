<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory, SoftDeletes;
    protected $guarded = ['id'];

    protected $fillable = ['user_id','name','slug','category_id','brand_id','model','unit','weight','minimum_purchase_qty','buying_price','selling_price','discount_from','discount_to','discount_price','discount_type','quantity','sell_quantity','sku_code','color','size','thumbnail','images','warranty','warranty_duration','warranty_condition','description','is_free_shipping','show_stock_qty','cash_on_delivery','low_stock_qty','estimate_shipping_day','featured','status','videoid'];


    public function user()
    {
        return $this->belongsTo(User::class, 'create_by');
    }
    public function brand()
    {
        return $this->belongsTo(Brand::class, 'brand_id');
    }
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }
    public function ProductStock()
    {
        return $this->hasMany(ProductStock::class);
    }

    public function scopeActive($query)
    {
        return $query->where('status', 'active');
    }
    public function scopeInactive($query)
    {
        return $query->where('status', 'inactive');
    }

    // new_code
    // public function getMainPriceAttribute()
    // {
    //     if ($this->discount_type === 'fixed') {
    //         return $this->selling_price - $this->discount_price;
    //     } elseif ($this->discount_type === 'percent') {
    //         return $this->selling_price - ($this->selling_price * ($this->discount_price / 100));
    //     }

    //     return $this->selling_price; // No discount
    // }

    //new code
    public function orderDetails()
    {
        return $this->hasMany(OrderDetails::class, 'product_id');
    }
}
