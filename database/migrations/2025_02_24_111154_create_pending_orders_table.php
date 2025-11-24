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
        // Only create the table if it does NOT exist
        if (!Schema::hasTable('pending_orders')) {

            Schema::create('pending_orders', function (Blueprint $table) {
                $table->id();
                $table->string('order_no')->unique();
                $table->string('customer_name');
                $table->string('customer_phone');
                $table->decimal('total', 10, 2);
                $table->decimal('grand_total', 10, 2);
                $table->text('shipping_address');
                $table->string('payment_type');
                $table->string('payment_status')->default('Pending');
                $table->decimal('delivery_charge', 10, 2);
                $table->string('tracking_code')->unique();
                $table->date('date');
                $table->foreignId('customer_id')->nullable()->constrained()->onDelete('set null');
                $table->string('currency')->default('BDT');
                $table->json('cart_items'); // Store cart items as JSON
                $table->string('transaction_id')->unique();
                $table->timestamps();
            });

        }
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pending_orders');
    }
};
