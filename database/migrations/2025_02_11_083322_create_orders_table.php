<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Only create table if it doesn't exist already
        if (!Schema::hasTable('orders')) {
            Schema::create('orders', function (Blueprint $table) {
                $table->id();
                $table->string('order_no')->unique();
                $table->date('date');
                $table->string('tracking_code')->nullable();
                $table->string('customer_name')->nullable();
                $table->string('customer_phone')->nullable();
                $table->text('shipping_address')->nullable();
                $table->enum('delivery_status', ['pending','approved','shipping','delivered','cancelled'])->default('pending');
                $table->string('payment_type')->nullable();
                $table->string('payment_status')->nullable();
                $table->text('payment_details')->nullable();
                $table->double('grand_total', 10, 2)->default(0);
                $table->double('discount', 10, 2)->default(0);
                $table->string('discount_code')->nullable();
                $table->string('delivery_charge')->nullable();
                $table->double('total', 10, 2)->default(0);
                $table->double('commission_calculated', 10, 2)->default(0);
                $table->foreignId('user_id')->constrained()->onDelete('cascade');
                $table->foreignId('seller_id')->nullable()->constrained('users')->onDelete('set null');
                
                $table->foreignId('customer_id')->nullable()->constrained()->onDelete('set null');
                $table->timestamps();
            });
        }
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
