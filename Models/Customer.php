<?php

// namespace App\Models;

// use Illuminate\Database\Eloquent\Model;
// use Illuminate\Database\Eloquent\Factories\HasFactory;

// class Customer extends Model
// {

//     protected $guard = 'customer';
//     protected $fillable = ['name', 'email', 'password', 'phone', 'offer_mail', 'referral_code', 'referral_by', 'referral_balance','address','address2', 'address3','address4'];

//     public function referral()
//     {
//         return $this->belongsTo(Customer::class, 'referral_by');
//     }

//     public function referredCustomers()
//     {
//         return $this->hasMany(Customer::class, 'referral_by');
//     }
// }

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
// use Illuminate\Database\Eloquent\Model;


class Customer extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $guard = 'customer';

    protected $fillable = [
        'name', 'email', 'password', 'phone', 'offer_mail',
        'referral_code', 'referral_by', 'referral_balance',
        'address', 'address2', 'address3', 'address4'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    public function referral()
    {
        return $this->belongsTo(Customer::class, 'referral_by');
    }

    public function referredCustomers()
    {
        return $this->hasMany(Customer::class, 'referral_by');
    }
}

