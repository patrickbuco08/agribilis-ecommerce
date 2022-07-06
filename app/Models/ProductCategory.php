<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    use HasFactory;

    protected $table = 'product_categories';

    protected $fillable = ['category_id', 'subcategory_id', 'sub_subcategory_id'];

    protected $hidden = [
        'id',
        'created_at',
        'updated_at'
    ];

    public function main()
    {
        return $this->hasOne(Category::class, 'id', 'category_id');
    }

    public function sub()
    {
        return $this->hasOne(SubCategory::class, 'id', 'subcategory_id');
    }

    public function subSub()
    {
        return $this->hasOne(SubSubCategory::class, 'id', 'sub_subcategory_id');
    }

}
