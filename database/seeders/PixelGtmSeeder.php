<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class PixelGtmSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('pixel_gtms')->insert([
            'pixel' => '<script>Your Pixel Code Here</script>',
            'gtm'   => '<script>Your GTM Code Here</script>',
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
