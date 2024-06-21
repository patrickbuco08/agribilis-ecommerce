<?php

namespace Agribilis\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;

    protected $table = 'subcategories';

    public function subSubCategory()
    {
        return $this->hasMany(SubSubCategory::class, 'subcategory_id');
        //subcategory_id = foreign key
    }

    public function products()
    {
        return $this->hasMany(ProductCategory::class, 'subcategory_id')->count();
    }

}
