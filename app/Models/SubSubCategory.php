<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubSubCategory extends Model
{
    use HasFactory;

    protected $table = 'sub_subcategories';

    public function products()
    {
        return $this->hasMany(ProductCategory::class, 'sub_subcategory_id')->count();
    }
    
}
