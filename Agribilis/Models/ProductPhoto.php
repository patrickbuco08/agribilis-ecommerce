<?php

namespace Agribilis\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductPhoto extends Model
{
    use HasFactory;

    protected $table = 'product_photos';

    protected $fillable = ['product_id', 'name'];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];

}
