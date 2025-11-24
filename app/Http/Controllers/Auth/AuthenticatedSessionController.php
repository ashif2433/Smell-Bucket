<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use Carbon\Carbon;
use App\Mail\SendOtpCode;
use Illuminate\Support\Facades\Mail;

use Illuminate\View\View;


class AuthenticatedSessionController extends Controller
{

    public function create(): View
    {
        return view('auth.login');
    }

    // public function store(LoginRequest $request): RedirectResponse{

    //     $request->authenticate();
    //     $request->session()->regenerate();
    //     $otpCode = rand(100000, 999999);
    //     $user = auth()->user();
    //     $user->otpcode = $otpCode;
    //     $user->otp_expires_at = Carbon::now()->addMinutes(10);
    //     $user->save();

    //     session(['otp_verified' => false]);

    //     Mail::to($user->email)->send(new SendOtpCode($otpCode));

    //     return redirect()->route('mailotp');
    // }
    
    public function store(LoginRequest $request): RedirectResponse
    {
        $request->authenticate();

        $request->session()->regenerate();

        if(Auth::user()->usertype == 'admin'){
            return redirect(route('admin.dashboard'));
        }

        return redirect()->intended(route('dashboard', absolute: false));
    }


    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/login');
    }
}
