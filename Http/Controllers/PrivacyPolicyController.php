<?php

namespace App\Http\Controllers;

use App\Models\PrivacyPolicy;
use Illuminate\Http\Request;

class PrivacyPolicyController extends Controller
{
    public function index()
    {
        $policies = PrivacyPolicy::all(); // shows the saved policy
        return view('frontend.privacy', compact('policies'));
    }

}
