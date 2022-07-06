<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('string_id');
            $table->string('name');
            $table->text('description');
            $table->text('tags');
            $table->string('unit', 10);
            $table->smallInteger('rating');
            $table->integer('orders');
            $table->integer('stock');
            $table->integer('price');
            $table->tinyInteger('delivery_min');
            $table->tinyInteger('delivery_max');
            $table->string('thumbnail', 50);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
};
