<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\SubCategory;
use App\Models\SubSubCategory;

class CategoryController extends Controller
{
    public function getCategory(Category $category)
    {
        return $category;
    }

    public function getSubCategory($categoryID)
    {
        $subCategories = SubCategory::where('category_id', $categoryID)->get();
        return response()->json($subCategories, 200);
    }

    public function getSubSubCategory($subCategoryID)
    {
        $subSubCategories = SubSubCategory::where('subcategory_id', $subCategoryID)->get();
        return response()->json($subSubCategories, 200);
    }
}
