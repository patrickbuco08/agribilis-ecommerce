<?php

namespace Agribilis\Http\Controllers;

use Agribilis\Models\Category;
use Agribilis\Models\User;
use Faker\Factory as Faker;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class FakerController extends Controller
{
    public function createProducts()
    {
        $faker = Faker::create();

        $images = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "12-1.jpg", "12-2.jpg", "ampalaya.png", "bagasse.png", "banana.jpg", "cabbage.png", "cassava.png", "cassava-flour.png", "cavendish.png", "coconut-milk.png", "coconut-peat.png", "coffee-arabica.png", "coffee-liberica.png", "copa.png", "ground-coffee.png", "indian-mango.png", "lakatan.png", "onion.png", "pineapple.png", "pineapple-juice.png", "potato-2.png", "product-1.jpg", "product-2.jpg", "product-3.jpg", "product-4.jpg", "product-5.jpg", "product-6.jpg", "product-7.jpg", "product-8.jpg", "product-9.jpg", "rice-husk.png", "senorita.png", "sugarcane.png", "sweet-potato.png", "tobacco.png", "tomato-catsup.png", "white-corn.png", "yellow-corn.png"];

        $fakeUser = [
            'full_name' => $faker->name(),
            'email' => $faker->unique()->safeEmail(),
            'email_verified_at' => now(),
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            'remember_token' => Str::random(10),
        ];


        $fakeUserInfo = [
            'shop_name' => $faker->words(rand(1, 4), true),
            'description' => $faker->words(80,  true),
            'location' => $faker->streetAddress,
            'phone' => $faker->phoneNumber,
            'photo' => 'avatar1.jpg'
        ];

        $fakeUserRole = [
            'role_id' => 2
        ];

        try {

            DB::beginTransaction();

            $user = User::create($fakeUser);

            $user->info()->create($fakeUserInfo);

            $user->role()->create($fakeUserRole);

            for ($i = 0; $i < 10; $i++) {

                $product_name = $faker->words(rand(1, 4), true);

                $userProduct = $user->products()->create([
                    'string_id' => implode("-", explode(" ", strtolower($product_name))),
                    'name' => $product_name,
                    'description' => $faker->words(80,  true),
                    'tags' => implode(", ", $faker->words(20)),
                    'unit' => 'kg',
                    'rating'                =>      $faker->numberBetween($min = 0, $max = 100),
                    'orders'                =>      $faker->numberBetween($min = 0, $max = 3000),
                    'stock'                 =>      $faker->numberBetween($min = 0, $max = 350),
                    'price'                 =>      $faker->numberBetween($min = 25, $max = 8000),
                    'delivery_min'          =>      $faker->numberBetween($min = 1, $max = 2),
                    'delivery_max'          =>      $faker->numberBetween($min = 3, $max = 10),
                    'thumbnail'             =>      $images[rand(0, 49)],
                    'created_at'            =>      $faker->dateTimeBetween($startDate = '-5 years', $endDate = 'now')->format('Y-m-d H:i:s'),
                ]);

                $userProduct->photos()->createMany([
                    ['name'                =>      $images[rand(0, 49)]],
                    ['name'                =>      $images[rand(0, 49)]],
                    ['name'                =>      $images[rand(0, 49)]],
                    ['name'                =>      $images[rand(0, 49)]]
                ]);

                $productReviews = [];

                $mainCategory = Category::all()->random(1)->first();
                $subCategory = $mainCategory->subCategory->random(1)->first();
                $subSubCategory = !$subCategory->subSubCategory->isEmpty() ? $subCategory->subSubCategory->random(1)->first() : null;

                $productCategory = [
                    'category_id' => $mainCategory->id,
                    'subcategory_id' => $subCategory->id,
                    'sub_subcategory_id' => $subSubCategory != null ? $subSubCategory->id : null
                ];

                $userProduct->category()->create($productCategory);
            }
            DB::commit();
            return $user;
        } catch (\Throwable $th) {
            DB::rollback();
            return $th;
        }
    }

    public function createUser()
    {
        $faker = Faker::create();
        $fakeUser = [
            'full_name' => 'Patrick Demillo Buco',
            'email' => 'jpbuco@cvsu.edu.ph',
            'email_verified_at' => now(),
            'password' => Hash::make('password'), // password
            'remember_token' => Str::random(10),
        ];

        try {
            DB::beginTransaction();

            $user = User::create($fakeUser);

            $user->role()->create([
                'role_id' => 3
            ]);

            $user->addresses()->createMany([
                [
                    'full_name' => 'Patrick Demillo Ocubs',
                    'location' => 'Luksuhin-Sulsugin Road, Marcos Highway St., Alfonso Cavite',
                    'phone' => '+639773390832',
                    'postal_code' => 4123,
                    'set_as_default' => true
                ],
                [
                    'full_name' => $faker->name(),
                    'location' => $faker->streetAddress,
                    'phone' => $faker->phoneNumber,
                    'postal_code' => 4123,
                    'set_as_default' => false
                ],
                [
                    'full_name' => $faker->name(),
                    'location' => $faker->streetAddress,
                    'phone' => $faker->phoneNumber,
                    'postal_code' => 4123,
                    'set_as_default' => false
                ],
                [
                    'full_name' => $faker->name(),
                    'location' => $faker->streetAddress,
                    'phone' => $faker->phoneNumber,
                    'postal_code' => 4123,
                    'set_as_default' => false
                ]
            ]);

            DB::commit();
            return $user;
        } catch (\Throwable $th) {
            DB::rollback();
            return $th;
        }
    }
}
