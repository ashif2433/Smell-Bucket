<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
{
    Schema::table('all_settings', function (Blueprint $table) {
        $table->integer('urban')->default(0)->after('d_charge_outside_dhaka');
    });
}

public function down()
{
    Schema::table('all_settings', function (Blueprint $table) {
        $table->dropColumn('urban');
    });
}


};
