<?php

use App\Http\Controllers\Auth\SocialController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SslCommerzPaymentController;
use App\Http\Controllers\PrivacyPolicyController;
use App\Http\Controllers\ContactController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get( 'usertype', function () {
//     $userType = Auth::user()->user_type;

//     if ( in_array( $userType, ['admin', 'staff'] ) ) {
//         return redirect()->route( 'admin.dashboard' );
//     } elseif ( $userType === 'seller' ) {
//         return redirect()->route( 'seller.dashboard' );
//     }

//     return redirect()->route( 'login' );
// } )->name( 'dashboard' );

Route::get('/cc', function () {
    Artisan::call('config:clear');
    Artisan::call('cache:clear');
    return 'Cleared!';
});

// main
Route::get('usertype', function () {

    if (Auth::user()->user_type === 'admin') {
        return redirect()->route('admin.dashboard');
    }
    else if (Auth::user()->user_type === 'seller') {
        return redirect()->route('seller.dashboard');
    };
    return redirect()->route('login');
})->name('dashboard');

Route::middleware( 'auth' )->group( function () {
    Route::get( '/profile', [ProfileController::class, 'edit'] )->name( 'profile.edit' );
    Route::patch( '/profile', [ProfileController::class, 'update'] )->name( 'profile.update' );
    Route::delete( '/profile', [ProfileController::class, 'destroy'] )->name( 'profile.destroy' );
} );

require __DIR__ . '/auth.php';
require __DIR__ . '/store_site.php';
// require __DIR__ . '/breadcrumbs.php';

// Google login
Route::get( 'auth/google', [SocialController::class, 'redirectToGoogle'] );
Route::get( 'auth/google/callback', [SocialController::class, 'handleGoogleCallback'] );

// Facebook login
Route::get( 'auth/facebook', [SocialController::class, 'redirectToFacebook'] );
Route::get( 'auth/facebook/callback', [SocialController::class, 'handleFacebookCallback'] );

Route::fallback( function () {
    return response()->view( 'errors.404', [], 404 );
} );


// SSLCOMMERZ Start
// Route::middleware( 'checkcustomer' )->group( function () {
//     Route::post( '/pay', [SslCommerzPaymentController::class, 'index'] );

// } );

//edited
Route::post( '/pay', [SslCommerzPaymentController::class, 'index'] );


Route::post( '/success', [SslCommerzPaymentController::class, 'success'] );
Route::post( '/fail', [SslCommerzPaymentController::class, 'fail'] );
Route::post( '/cancel', [SslCommerzPaymentController::class, 'cancel'] );
Route::post( '/ipn', [SslCommerzPaymentController::class, 'ipn'] );


// ADMIN PRIVACY POLICY CRUD
Route::prefix('admin')->middleware(['auth'])->group(function () {

    Route::get('/privacy', [PrivacyPolicyController::class, 'index'])->name('privacy.index');
    Route::get('/privacy/create', [PrivacyPolicyController::class, 'create'])->name('privacy.create');
    Route::post('/privacy/store', [PrivacyPolicyController::class, 'store'])->name('privacy.store');
    Route::get('/privacy/edit/{id}', [PrivacyPolicyController::class, 'edit'])->name('privacy.edit');
    Route::post('/privacy/update/{id}', [PrivacyPolicyController::class, 'update'])->name('privacy.update');
    Route::delete('/privacy/delete/{id}', [PrivacyPolicyController::class, 'destroy'])->name('privacy.delete');

});

// FRONTEND PRIVACY PAGE
Route::get('/privacy-policy', [PrivacyPolicyController::class, 'showFrontend'])->name('privacy.policy');

// Contact Page
Route::get('/contact', [ContactController::class, 'index'])->name('contact.page');
Route::post('/contact/send', [ContactController::class, 'sendMessage'])->name('contact.send');
