<?php

namespace Agribilis\Http\Controllers;

use Agribilis\Models\Category;
use Agribilis\Models\SubCategory;
use Agribilis\Models\SubSubCategory;

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
