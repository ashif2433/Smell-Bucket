<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TopmarSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('topmars')->insert([
            'details' => 'Home Delivery Free. Home Delivery Free. Home Delivery Free.',
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
