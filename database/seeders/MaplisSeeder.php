<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class MaplisSeeder extends Seeder
{
    public function run()
    {
        DB::table('maplis')->insert([
            [
                'map' => 'pb=!1m18!1m12!1m3!1d10319.427562701268!2d90.40157658594991!3d23.872996496008664!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c43b23589ec9%3A0x3f71bf01a9cd40de!2sBNS%20Center!5e0!3m2!1sen!2sbd!4v1745148083350!5m2!1sen!2sbd',
                'licence' => '02-9854',
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ]);
    }
}
