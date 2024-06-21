<?php

namespace Agribilis\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'full_name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function info(){
        return $this->hasOne(UserInformation::class);
    }

    //user's selected address
    public function address()
    {
        return $this->hasOne(Address::class)->where('set_as_default', true);
    }

    public function addresses()
    {
        return $this->hasMany(Address::class);
    }

    public function role(){
        return $this->hasOne(UserRole::class);
    }

    public function cart()
    {
        return $this->hasMany(Cart::class);
    }

    public function cartCount()
    {
        return $this->cart->reduce(function ($total, $cart) {
            return $total + $cart->quantity;
        });
    }

    public function orders()
    {
        return $this->hasMany(GroupOrder::class);
    }

    public function orderItems(){
        $items = collect([]);

        $orders = $this->orders->load(['items.product', 'items.status', 'items.status.info']);
        
        foreach ($orders as $order) {
            foreach ($order->items as $item) {
                $items->push($item);
            }
        }

        return $items;
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public function transactions(){
        // 1st argument is foreign key sa Transaction Model which is user_id
        // 2nd argument is local key ng User Model which is id
        return $this->hasMany(Transaction::class, 'user_id', 'id')->orderBy('created_at', 'desc');
    }

    public function isVendor(){
        return $this->role->role_id === 2;
    }


}
