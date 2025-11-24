<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $guarded = ['id', 'created_at', 'updated_at'];

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }

    public function shipping()
    {
        return $this->belongsTo(Shipping::class, 'shipping_id');
    }

    public function OrderDetails()
    {
        return $this->hasMany(OrderDetails::class, 'order_id');
    }

    public function payment()
    {
        return $this->belongsTo(Payment::class, 'id', 'order_id');
    }

    // new 16
    public function order_details()
    {
        return $this->hasMany(OrderDetails::class, 'order_id');
    }
}
