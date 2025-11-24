<?php

namespace App\Http\Controllers;

use App\Models\WebsiteInfo;
use App\Models\ContactMessage;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    // Show Contact Page
    public function index()
    {
        $info = WebsiteInfo::first(); // single row
        return view('frontend.contact', compact('info'));
    }

    // Store Contact Form Messages
    public function sendMessage(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'message' => 'required',
        ]);

        ContactMessage::create([
            'name' => $request->name,
            'email' => $request->email,
            'message' => $request->message,
        ]);

        return back()->with('success', 'Your message has been sent successfully!');
    }
}
