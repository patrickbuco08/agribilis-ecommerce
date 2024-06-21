<?php

namespace Agribilis\Http\Controllers;

use Carbon\Carbon;
use Agribilis\Models\Product;
use Agribilis\Models\Category;
use Agribilis\Models\SubCategory;
use Illuminate\Http\Request;
use Agribilis\Models\SubSubCategory;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;
use Agribilis\Http\Requests\AddProductRequest;


class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', 'verified'], ['only' => ['vendorIndex', 'storeProduct', 'productList']]);
    }

    public function index(Request $request)
    {
        $product = Product::with(['owner', 'owner.info', 'photos', 'reviews'])->where('string_id', $request->string_id)->firstOrFail();

        return view('buyer.product', [
            'product' => $product
        ]);
    }

    public function products(Request $request, $mainCategory = null, $subCategory = null, $subSubCategory = null)
    {

        // return $request;

        $products = Product::with(['owner', 'owner.info', 'photos', 'reviews']);
        $categories = Cache::rememberForever('categories', function () {
            return Category::get();
        });

        $subCategories = null;
        $subSubCategories = null;
        $priceFilter = $request->has('price') && $request->price == "high-to-low" ? 'DESC' : 'ASC';


        if ($mainCategory) {
            $filtered = $categories->filter(function ($category) use ($mainCategory) {
                return $category->string_id == $mainCategory;
            })->first();

            $subCategories = $filtered->subCategory;
        }

        if ($subCategory) {
            $filtered = $subCategories->filter(function ($category) use ($subCategory) {
                return $category->string_id == $subCategory;
            })->first();

            $subSubCategories = $filtered->subSubCategory;
        }

        if ($mainCategory) {

            $products->with(['category']);

            $products->whereHas('category.main', function ($query) use ($mainCategory) {
                $query->where('string_id', '=', $mainCategory);
            });
        }

        if ($subCategory) {
            $products->whereHas('category.sub', function ($query) use ($subCategory) {
                $query->where('string_id', '=', $subCategory);
            });
        }

        if ($subSubCategory) {
            $products->whereHas('category.subSub', function ($query) use ($subSubCategory) {
                $query->where('string_id', '=', $subSubCategory);
            });
        }

        if ($request->has('search')) {
            $products->where('name', 'like', '%' . $request->search . '%');
        }

        $products->orderBy('price', $priceFilter);

        return view('buyer.products', [
            'count' => $products->count(),
            'products' => $products->paginate(9),
            'categories' => $categories,
            'subCategories' => $subCategories,
            'subSubCategories' => $subSubCategories,
            'categorySearch' => [
                'main' => $mainCategory,
                'sub' => $subCategory,
                'subSub' => $subSubCategory
            ]
        ]);
    }

    // vendor
    public function vendorIndex()
    {
        $categories = Cache::rememberForever('categories', function () {
            return Category::get();
        });
        return view('vendor.add-product', [
            'categories' => $categories
        ]);
    }

    public function productList()
    {
        $products = auth()->user()->products;
        return view('vendor.product-list', [
            'products' => $products
        ]);
    }

    public function showEditProduct(Product $product)
    {
        $categories = Cache::rememberForever('categories', function () {
            return Category::get();
        });

        if (!$product->ownedBy(auth()->user())) {
            return response(null, 409);
        }

        $product->load(['category', 'photos']);
        return view('vendor.edit-product', [
            'product' => $product,
            'categories' => $categories
        ]);
    }

    public function updateProduct(Request $request, Product $product)
    {

        if (!$product->ownedBy(auth()->user())) {
            return response(null, 409);
        }

        return "under construction";
    }

    public function storeProduct(AddProductRequest $request)
    {
        $validated = $request->safe();
        $validated->tags = collect(json_decode($validated->tags))->map(function ($tag) {
            return $tag->value;
        })->implode(", ");

        try {
            DB::beginTransaction();

            $productPhotos = collect([]);
            foreach ($request->file('files') as $file) {
                $original_filename = $file->getClientOriginalName();
                $image_name = time() . rand(1, 100) . "-" . $file->getClientOriginalName();
                $productPhotos->push([
                    'name' => $image_name
                ]);
                $file->storeAs('frontend/images/items', $image_name, 'product_storage');
            }

            $product = auth()->user()->products()->create([
                'string_id'             =>  str_replace([' ', '/'], '-', $validated->name),
                'name'                  =>  $validated->name,
                'description'           =>  $validated->description,
                'tags'                  =>  $validated->tags,
                'unit'                  =>  $validated->unit,
                'order_limit'           =>  $validated->order_limit,
                'rating'                =>  60,
                'orders'                =>  0,
                'stock'                 =>  $validated->stock,
                'price'                 =>  $validated->price,
                'delivery_min'          =>  $validated->delivery_min,
                'delivery_max'          =>  $validated->delivery_max,
                'thumbnail'             =>  $productPhotos->first()['name'],
                'created_at'            =>  Carbon::now(),
            ]);

            $product->photos()->createMany($productPhotos);
            $product->category()->create([
                'category_id' => $validated->category_id,
                'subcategory_id' => $validated->subcategory_id ?? null,
                'sub_subcategory_id' => $validated->sub_subcategory_id ?? null
            ]);

            DB::commit();
            return back()->with('productAdded', 'you`ve successfully added a new product');
        } catch (\Throwable $th) {
            DB::rollback();
            echo "ayayay! mamamia ulalam! :(";
            return $th;
        }
    }

    public function viewImage($filename)
    {
        return Storage::get('public/product_images/' . $filename);
    }
}
