<?php

namespace Agribilis\Models;

use Agribilis\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $table = 'cart_items';

    protected $fillable = ['user_id', 'product_id', 'price', 'quantity'];

    public function owner()
    {
        //id = id sa users table
        //user_id sa cart_items table
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    public function ownedBy(User $user)
    {
        return $this->user_id == $user->id;
    }

    public function totalPriceOfItem()
    {
        return $this->price*$this->quantity;
    }

    public function product()
    {
        //id = id sa products table
        return $this->hasOne(Product::class, 'id', 'product_id');
    }
}
