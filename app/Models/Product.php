<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = ['string_id', 'name', 'description', 'tags', 'unit', 'rating', 'orders', 'stock', 'price', 'delivery_min', 'delivery_max', 'thumbnail', 'created_at'];

    protected $hidden = [
        'user_id',
        'updated_at'
    ];

    public function owner()
    {
        //1st argument is foreign key sa User Model which is yung id
        //2nd argument is local key sa Product Model which is user_id
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    public function ownedBy(User $user)
    {
        return $this->owner->id === $user->id;
    }

    public function photos()
    {
        return $this->hasMany(ProductPhoto::class);
    }

    public function reviews()
    {
        return $this->hasMany(ProductReview::class);
    }

    public function category()
    {
        return $this->hasOne(ProductCategory::class, 'product_id');
    }

    public function unit()
    {
        return $this->hasOne(ProductUnit::class);
    }


}
