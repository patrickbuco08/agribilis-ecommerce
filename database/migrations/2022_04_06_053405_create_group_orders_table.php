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
        Schema::create('group_orders', function (Blueprint $table) {
            $table->id();
            $table->string('tracking_number', 50);
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('mode_of_payment', 20);
            $table->enum('approval_status',['pending','approved','cancelled'])->default('pending');
            $table->foreignId('status_id')->constrained('status');
            $table->date('delivery_min');
            $table->date('delivery_max');
            $table->text('note_by_owner');
            $table->text('note_by_vendor');
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
        Schema::dropIfExists('group_orders');
    }
};
