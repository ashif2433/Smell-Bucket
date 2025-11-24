<?php

namespace App\Providers;

use App\Models\AllSetting;
use App\Models\Category;
use App\Models\WebsiteInfo;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Route;  // Add this line
use App\Http\Middleware\EnsureOtpVerifiedMiddleware;
use Illuminate\Support\Facades\Request; // Add this at the top with your other imports
use Illuminate\Support\Facades\Log;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    public function boot(): void
    {

    //   // 🔐 Environment-based restriction (domain or IP check)
    // if (app()->runningInConsole()) {
    //     // Skip check if running via artisan or queue worker
    //     return;
    // }

    // $allowedHost = env('SLL_HOST');
    // $allowedIp   = env('AUTHORIZED_IP');
    //  // 🔐 Hardcoded allowed values
    // // $allowedHost = 'dharaonlinebd.com';      // Replace with your real domain
    // // $allowedIp   = '123.123.123.123';     // Replace with your real IP

    // if ($allowedHost && Request::getHost() !== $allowedHost) {
    //     Log::warning('Unauthorized domain access: ' . Request::getHost());
    //     abort(403, 'Unauthorized');
    // }

    // if ($allowedIp && Request::ip() !== $allowedIp) {
    //     Log::warning('Unauthorized IP access: ' . Request::ip());
    //     abort(403, 'Unauthorized IP');
    // }


        #share menu categories for all pages
        $categories   = Category::with('productCount')->where('root', 0)->where('status', 'active')->get();
        View::share('menucategories', $categories);
        $info   = WebsiteInfo::first();
        View::share('websiteInfo', $info);
        $settingall   = AllSetting::first();
        View::share('setting', $settingall);

        #Share Breadcrumbs for all page //its a diglactic/laravel-breadcrumbs package
        Paginator::useBootstrap();
        Schema::defaultStringLength(191);

        Route::aliasMiddleware('otp.verified', EnsureOtpVerifiedMiddleware::class);
    }
}
