<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductReview extends Model
{
    use HasFactory;

    protected $table = 'product_reviews';

    protected $fillable = ['user_id', 'comment', 'rating'];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];

}
