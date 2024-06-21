<?php

use Agribilis\Models\User;
use Agribilis\Models\Category;
use Faker\Factory as Faker;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;

class CreateInitialData extends Migration
{

    private const PRODUCT_IMAGES = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "12-1.jpg", "12-2.jpg", "ampalaya.png", "bagasse.png", "banana.jpg", "cabbage.png", "cassava.png", "cassava-flour.png", "cavendish.png", "coconut-milk.png", "coconut-peat.png", "coffee-arabica.png", "coffee-liberica.png", "copa.png", "ground-coffee.png", "indian-mango.png", "lakatan.png", "onion.png", "pineapple.png", "pineapple-juice.png", "potato-2.png", "product-1.jpg", "product-2.jpg", "product-3.jpg", "product-4.jpg", "product-5.jpg", "product-6.jpg", "product-7.jpg", "product-8.jpg", "product-9.jpg", "rice-husk.png", "senorita.png", "sugarcane.png", "sweet-potato.png", "tobacco.png", "tomato-catsup.png", "white-corn.png", "yellow-corn.png"];

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $this->doInsertInitialData();
        $this->doCreateUser();

        for ($i = 0; $i < 20; $i++) {
            $this->doCreateFakeProducts();
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('initial_data');
    }

    private function doCreateUser()
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

            return $th->getMessage();
        }
    }

    private function doCreateFakeProducts()
    {
        $faker = Faker::create();

        $user = [
            'full_name' => $faker->name(),
            'email' => $faker->unique()->safeEmail(),
            'email_verified_at' => now(),
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            'remember_token' => Str::random(10),
        ];

        $userInfo = [
            'shop_name' => $faker->words(rand(1, 4), true),
            'description' => $faker->words(80,  true),
            'location' => $faker->streetAddress,
            'phone' => $faker->phoneNumber,
            'photo' => 'avatar1.jpg'
        ];

        $role = [
            'role_id' => 2
        ];

        try {
            DB::beginTransaction();

            $user = User::create($user);

            $user->info()->create($userInfo);

            $user->role()->create($role);

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
                    'order_limit'           =>      $faker->numberBetween($min = 5, $max = 20),
                    'stock'                 =>      $faker->numberBetween($min = 0, $max = 350),
                    'price'                 =>      $faker->numberBetween($min = 25, $max = 8000),
                    'delivery_min'          =>      $faker->numberBetween($min = 1, $max = 2),
                    'delivery_max'          =>      $faker->numberBetween($min = 3, $max = 10),
                    'thumbnail'             =>      self::PRODUCT_IMAGES[rand(0, 49)],
                    'created_at'            =>      $faker->dateTimeBetween($startDate = '-5 years', $endDate = 'now')->format('Y-m-d H:i:s'),
                ]);

                $userProduct->photos()->createMany([
                    ['name'                =>      self::PRODUCT_IMAGES[rand(0, 49)]],
                    ['name'                =>      self::PRODUCT_IMAGES[rand(0, 49)]],
                    ['name'                =>      self::PRODUCT_IMAGES[rand(0, 49)]],
                    ['name'                =>      self::PRODUCT_IMAGES[rand(0, 49)]]
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

            echo $user;
        } catch (\Throwable $th) {
            DB::rollback();
            echo $th->getMessage();
        }
    }

    private function doInsertInitialData()
    {
        // roles
        DB::statement("
            INSERT INTO `roles` (`id`, `description`, `created_at`, `updated_at`) VALUES
            (1, 'admin', '2022-03-16 19:05:29', '2022-03-16 19:05:29'),
            (2, 'vendor', '2022-03-16 19:05:29', '2022-03-16 19:05:29'),
            (3, 'customer', '2022-03-16 19:05:29', '2022-03-16 19:05:29')
        ");

        // status
        DB::statement("
            INSERT INTO `status` (`id`, `name`, `created_at`, `updated_at`) VALUES
            (1, 'Pending', '2022-03-16 19:08:00', '2022-03-16 19:08:00'),
            (2, 'Order Confirmed', '2022-03-16 19:08:00', '2022-03-16 19:08:00'),
            (3, 'On The Way', '2022-03-16 19:08:00', '2022-03-16 19:08:00'),
            (4, 'Delivered', '2022-03-16 19:08:00', '2022-03-16 19:08:00'),
            (5, 'Cancelled', '2022-03-16 19:08:00', '2022-03-16 19:08:00')
        ");

        // categories
        DB::statement("
            INSERT INTO `categories` (`id`, `string_id`, `name`, `created_at`, `updated_at`) VALUES
            (1, 'crops', 'Crops', '2022-03-16 19:05:44', '2022-03-16 19:05:44'),
            (2, 'livestock', 'Livestock', '2022-03-16 19:05:44', '2022-03-16 19:05:44'),
            (3, 'poultry', 'Poultry', '2022-03-16 19:05:44', '2022-03-16 19:05:44'),
            (4, 'fisheries', 'Fisheries', '2022-03-16 19:05:44', '2022-03-16 19:05:44')
        ");

        // subcategories
        DB::statement("
            INSERT INTO `subcategories` (`id`, `category_id`, `string_id`, `name`, `created_at`, `updated_at`) VALUES
            (1, 1, 'palay', 'Palay', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (2, 1, 'corn', 'Corn', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (3, 1, 'banana', 'Banana', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (4, 1, 'coconut', 'Coconut', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (5, 1, 'mango', 'Mango', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (6, 1, 'sugarcane', 'Sugarcane', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (7, 1, 'pineapple', 'Pineapple', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (8, 1, 'cassava', 'Cassava', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (9, 1, 'rubber', 'Rubber', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (10, 1, 'sweet-potato', 'Sweet Potato', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (11, 1, 'onion', 'Onion', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (12, 1, 'eggplant', 'Eggplant', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (13, 1, 'coffee', 'Coffee', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (14, 1, 'tobaccoo', 'Tobaccoo', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (15, 1, 'abaca', 'Abaca', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (16, 1, 'tomato', 'Tomato', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (17, 1, 'potato', 'Potato', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (18, 1, 'ampalaya', 'Ampalaya', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (19, 1, 'cabbage', 'Cabbage', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (20, 1, 'calamansi', 'Calamansi', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (21, 1, 'mongo', 'Mongo', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (22, 1, 'cacao', 'Cacao', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (23, 1, 'lanzonez', 'Lanzonez', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (24, 1, 'watermelon', 'Watermelon', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (25, 1, 'peanut', 'Peanut', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (26, 1, 'ginger', 'Ginger', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (27, 1, 'lettuce', 'Lettuce', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (28, 1, 'other-crops', 'Other Crops', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
            (29, 2, 'hog', 'Hog', '2022-03-16 19:05:58', '2022-03-16 19:05:58'),
            (30, 2, 'cattle', 'Cattle', '2022-03-16 19:05:58', '2022-03-16 19:05:58'),
            (31, 2, 'carabo', 'Carabo', '2022-03-16 19:05:58', '2022-03-16 19:05:58'),
            (32, 2, 'goat', 'Goat', '2022-03-16 19:05:58', '2022-03-16 19:05:58'),
            (33, 2, 'dairy', 'Dairy', '2022-03-16 19:05:58', '2022-03-16 19:05:58'),
            (34, 3, 'chicken', 'Chicken', '2022-03-16 19:06:01', '2022-03-16 19:06:01'),
            (35, 3, 'chicken-eggs', 'Chicken Eggs', '2022-03-16 19:06:01', '2022-03-16 19:06:01'),
            (36, 3, 'duck', 'Duck', '2022-03-16 19:06:01', '2022-03-16 19:06:01'),
            (37, 3, 'duck-eggs', 'Duck Eggs', '2022-03-16 19:06:01', '2022-03-16 19:06:01'),
            (38, 4, 'milkfish', 'milkFish', '2022-03-16 19:06:06', '2022-03-16 19:06:06'),
            (39, 4, 'tilapia', 'Tilapia', '2022-03-16 19:06:06', '2022-03-16 19:06:06'),
            (40, 4, 'tiger-prawn', 'Tiger Prawn', '2022-03-16 19:06:06', '2022-03-16 19:06:06'),
            (41, 4, 'skipjack', 'Skipjack', '2022-03-16 19:06:06', '2022-03-16 19:06:06'),
            (42, 4, 'roundscad', 'Roundscad', '2022-03-16 19:06:06', '2022-03-16 19:06:06')
        ");

        // sub_subcategories
        DB::statement("
            INSERT INTO `sub_subcategories` (`id`, `subcategory_id`, `string_id`, `name`, `created_at`, `updated_at`) VALUES
            (1, 1, 'milled-rice', 'Milled Rice', '2022-03-16 19:06:15', '2022-03-16 19:06:15'),
            (2, 1, 'rice-husk', 'Rice Husk', '2022-03-16 19:06:15', '2022-03-16 19:06:15'),
            (3, 1, 'rice-bran', 'Rice Bran', '2022-03-16 19:06:15', '2022-03-16 19:06:15'),
            (4, 1, 'glutinous-rice-flour', 'Glutinous Rice Flour', '2022-03-16 19:06:15', '2022-03-16 19:06:15'),
            (5, 2, 'white-corn', 'White Corn', '2022-03-16 19:06:18', '2022-03-16 19:06:18'),
            (6, 2, 'yellow-corn', 'Yellow Corn', '2022-03-16 19:06:18', '2022-03-16 19:06:18'),
            (7, 3, 'cavendish', 'Cavendish', '2022-03-16 19:06:22', '2022-03-16 19:06:22'),
            (8, 3, 'lakatan', 'Lakatan', '2022-03-16 19:06:22', '2022-03-16 19:06:22'),
            (9, 3, 'saba', 'Saba', '2022-03-16 19:06:22', '2022-03-16 19:06:22'),
            (10, 3, 'señorita', 'Señorita', '2022-03-16 19:06:22', '2022-03-16 19:06:22'),
            (11, 4, 'coconut-peat', 'Coconut Peat', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
            (12, 4, 'coconut-milk', 'Coconut Milk', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
            (13, 4, 'desiccated-coconut', 'Desiccated Coconut', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
            (14, 4, 'coconut-juice', 'Coconut Juice', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
            (15, 4, 'copra', 'Copra', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
            (16, 4, 'coconut-shells', 'Coconut Shells', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
            (17, 5, 'indian', 'indian', '2022-03-16 19:06:29', '2022-03-16 19:06:29'),
            (18, 5, 'pico', 'pico', '2022-03-16 19:06:29', '2022-03-16 19:06:29'),
            (19, 5, 'carabao', 'carabao', '2022-03-16 19:06:29', '2022-03-16 19:06:29'),
            (20, 6, 'crane-tops', 'Crane Tops', '2022-03-16 19:06:33', '2022-03-16 19:06:33'),
            (21, 6, 'bagasse', 'Bagasse', '2022-03-16 19:06:33', '2022-03-16 19:06:33'),
            (22, 6, 'molasses', 'Molasses', '2022-03-16 19:06:33', '2022-03-16 19:06:33'),
            (23, 7, 'fresh-pineapple', 'Fresh Pineapple', '2022-03-16 19:06:36', '2022-03-16 19:06:36'),
            (24, 7, 'pineapple-candy', 'Pineapple Candy', '2022-03-16 19:06:36', '2022-03-16 19:06:36'),
            (25, 7, 'pineapple-chunks', 'Pineapple Chunks', '2022-03-16 19:06:36', '2022-03-16 19:06:36'),
            (26, 7, 'pineapple-slices', 'Pineapple Slices', '2022-03-16 19:06:36', '2022-03-16 19:06:36'),
            (27, 7, 'pineapple-juice', 'Pineapple Juice', '2022-03-16 19:06:36', '2022-03-16 19:06:36'),
            (28, 8, 'raw-cassava', 'Raw Cassava', '2022-03-16 19:06:40', '2022-03-16 19:06:40'),
            (29, 8, 'cassava-chips', 'Cassava Chips', '2022-03-16 19:06:40', '2022-03-16 19:06:40'),
            (30, 8, 'cassava-starch', 'Cassava Starch', '2022-03-16 19:06:40', '2022-03-16 19:06:40'),
            (31, 8, 'cassava-flour', 'Cassava Flour', '2022-03-16 19:06:40', '2022-03-16 19:06:40'),
            (32, 10, 'raw-sweet-potato', 'Raw Sweet Potato', '2022-03-16 19:06:43', '2022-03-16 19:06:43'),
            (33, 10, 'sweet-potato-chips', 'Swwet Potato Chips', '2022-03-16 19:06:43', '2022-03-16 19:06:43'),
            (34, 13, 'arabica', 'arabica', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
            (35, 13, 'excelsa', 'excelsa', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
            (36, 13, 'liberica', 'liberica', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
            (37, 13, 'robusta', 'robusta', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
            (38, 13, 'drip-coffee', 'Drip Coffee', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
            (39, 13, 'ground-coffee', 'Ground Coffee', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
            (40, 13, 'roasted-beans', 'Roasted Beans', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
            (41, 13, 'instant-coffee', 'Instant Coffee', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
            (42, 16, 'fresh-tomato', 'Fresh Tomato', '2022-03-16 19:06:54', '2022-03-16 19:06:54'),
            (43, 16, 'tomato-paste', 'Tomato Paste', '2022-03-16 19:06:54', '2022-03-16 19:06:54'),
            (44, 16, 'tomato-catsup', 'Tomato Catsup', '2022-03-16 19:06:54', '2022-03-16 19:06:54'),
            (45, 16, 'dried-tomatoes', 'Dried Tomatoes', '2022-03-16 19:06:54', '2022-03-16 19:06:54'),
            (46, 17, 'raw-potato', 'Raw Potato', '2022-03-16 19:06:58', '2022-03-16 19:06:58'),
            (47, 17, 'potato-chips', 'Potato Chips', '2022-03-16 19:06:58', '2022-03-16 19:06:58'),
            (48, 19, 'cabbage-rolls', 'Cabbage Rolls', '2022-03-16 19:07:01', '2022-03-16 19:07:01'),
            (49, 20, 'calamansi-fruit', 'Calamansi Fruit', '2022-03-16 19:07:05', '2022-03-16 19:07:05'),
            (50, 20, 'calamansi-juice', 'Calamansi Juice', '2022-03-16 19:07:05', '2022-03-16 19:07:05'),
            (51, 20, 'calamansi-puree', 'Calamansi Puree', '2022-03-16 19:07:05', '2022-03-16 19:07:05'),
            (52, 21, 'mungbean-cake', 'Mungbean Cake', '2022-03-16 19:07:11', '2022-03-16 19:07:11'),
            (53, 21, 'mungbean-noodles', 'Mungbean Noodles', '2022-03-16 19:07:11', '2022-03-16 19:07:11'),
            (54, 21, 'mungbean-wine', 'Mungbean Wine', '2022-03-16 19:07:11', '2022-03-16 19:07:11'),
            (55, 21, 'mungbean-paste', 'Mungbean Paste', '2022-03-16 19:07:11', '2022-03-16 19:07:11'),
            (56, 22, 'tablea', 'tablea', '2022-03-16 19:07:14', '2022-03-16 19:07:14'),
            (57, 22, 'coconut-butter', 'Coconut Butter', '2022-03-16 19:07:14', '2022-03-16 19:07:14'),
            (58, 22, 'coconut-nibs', 'Coconut Nibs', '2022-03-16 19:07:14', '2022-03-16 19:07:14'),
            (59, 22, 'coconut-powder', 'Coconut Powder', '2022-03-16 19:07:14', '2022-03-16 19:07:14'),
            (60, 22, 'chocolate', 'Chocolate', '2022-03-16 19:07:14', '2022-03-16 19:07:14'),
            (61, 25, 'raw-peanuts', 'Raw Peanuts', '2022-03-16 19:07:19', '2022-03-16 19:07:19'),
            (62, 25, 'salted-peanuts', 'Salted Peanuts', '2022-03-16 19:07:19', '2022-03-16 19:07:19'),
            (63, 29, 'ears', 'Ears', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (64, 29, 'head', 'head', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (65, 29, 'neck', 'neck', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (66, 29, 'shoulder', 'shoulder', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (67, 29, 'loin', 'loin', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (68, 29, 'tenderloin', 'tenderloin', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (69, 29, 'ribs', 'ribs', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (70, 29, 'belly', 'belly', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (71, 29, 'leg', 'leg', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (72, 29, 'hock', 'hock', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (73, 29, 'knuckle', 'knuckle', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (74, 29, 'pork-ham', 'pork ham', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (75, 29, 'offal-and-edible-viscera', 'Offal and Edible Viscera', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
            (76, 30, 'beef', 'beef', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (77, 30, 'chuck', 'chuck', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (78, 30, 'beef-brisket', 'beef brisket', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (79, 30, 'beef-shank', 'beef shank', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (80, 30, 'beef-rib', 'beef rib', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (81, 30, 'short rib', 'short-rib', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (82, 30, 'beef-plate', 'beef plate', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (83, 30, 'short-loin', 'short loin', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (84, 30, 'sirloin', 'sirloin', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (85, 30, 'tenderloin', 'tenderloin', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (86, 30, 'rump', 'rump', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (87, 30, 'round', 'round', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (88, 30, 'beef-ham', 'beef ham', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (89, 30, 'offal-and-edible-viscera', 'Offal and Edible Viscera', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
            (90, 31, 'chuck', 'chuck', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
            (91, 31, 'brisket', 'brisket', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
            (92, 31, 'shank', 'shank', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
            (93, 31, 'beef-plate', 'beef plate', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
            (94, 31, 'short-loin', 'short loin', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
            (95, 31, 'tenderloin', 'tenderloin', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
            (96, 31, 'rump', 'rump', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
            (97, 31, 'round', 'round', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
            (98, 32, 'neck', 'neck', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
            (99, 32, 'leg', 'leg', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
            (100, 32, 'loin', 'loin', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
            (101, 32, 'rib', 'rib', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
            (102, 32, 'shoulder', 'shoulder', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
            (103, 32, 'shank', 'shank', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
            (104, 32, 'breast', 'breast', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
            (105, 32, 'fresh-milk', 'fresh milk', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
            (106, 32, 'cheese', 'cheese', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
            (107, 33, 'fresh-milk', 'Fresh Milk', '2022-03-16 19:07:39', '2022-03-16 19:07:39'),
            (108, 33, 'cheese', 'Cheese', '2022-03-16 19:07:39', '2022-03-16 19:07:39'),
            (109, 34, 'chicken-breast', 'chicken breast', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
            (110, 34, 'chicken-feet', 'chicken feet', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
            (111, 34, 'chicken-neck', 'chicken neck', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
            (112, 34, 'gizzard', 'gizzard', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
            (113, 34, 'intestine', 'intestine', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
            (114, 34, 'chicken-thigh', 'chicken thigh', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
            (115, 34, 'chicken-drumstick', 'chicken drumstick', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
            (116, 34, 'chicken-wings', 'chicken wings', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
            (117, 34, 'liver', 'liver', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
            (118, 37, 'salted-egg', 'salted egg', '2022-03-16 19:07:47', '2022-03-16 19:07:47'),
            (119, 37, 'balut', 'balut', '2022-03-16 19:07:47', '2022-03-16 19:07:47'),
            (120, 37, 'penoy', 'penoy', '2022-03-16 19:07:47', '2022-03-16 19:07:47'),
            (121, 38, 'dried', 'dried', '2022-03-16 19:07:51', '2022-03-16 19:07:51'),
            (122, 38, 'smoked', 'smoked', '2022-03-16 19:07:51', '2022-03-16 19:07:51')
        ");
    }
}
