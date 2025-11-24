<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\Verified;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\RedirectResponse;
use Carbon\Carbon;

class VerifyEmailController extends Controller
{
    /**
     * Mark the authenticated user's email address as verified.
     */
    public function __invoke(EmailVerificationRequest $request): RedirectResponse
    {
        if ($request->user()->hasVerifiedEmail()) {
            return redirect()->intended(route('dashboard', absolute: false).'?verified=1');
        }

        if ($request->user()->markEmailAsVerified()) {
            event(new Verified($request->user()));
        }

        return redirect()->intended(route('dashboard', absolute: false).'?verified=1');
    }

    public function mailotp()
    {
        // $websiteInfo = WebsiteInfo::first();
        return view('auth.mailotp');
    }

    public function verifyOtp(Request $request){

        $request->validate([
            'mailerotp' => 'required|numeric',
        ]);

        $user = Auth::user();
        if ($user && $user->otpcode == $request->mailerotp
         && now()->lt($user->otp_expires_at)) {
            session(['otp_verified' => true]);

            $user->otpcode = null;
            $user->otp_expires_at = null;
            $user->save();

            return redirect()->route('dashboard');
        }

        return back()->withErrors(['otp' => 'The OTP code is invalid or has expired. Please try again.']);
    }
}
