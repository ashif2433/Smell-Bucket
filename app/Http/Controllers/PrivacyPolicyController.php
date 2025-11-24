<?php

namespace App\Http\Controllers;

use App\Models\PrivacyPolicy;
use Illuminate\Http\Request;

class PrivacyPolicyController extends Controller
{
    // Show all policies (Admin Page)
    public function index()
    {
        $policies = PrivacyPolicy::latest()->get();
        return view('admin.pages.privacy.index', compact('policies'));
    }

    // Create Policy Form
    public function create()
    {
        return view('admin.pages.privacy.create');
    }

    // Store Policy
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'content' => 'required',
        ]);

        PrivacyPolicy::create($request->all());

        return redirect()->route('privacy.index')
            ->with('success', 'Privacy Policy added successfully.');
    }

    // Edit Policy Form
    public function edit($id)
    {
        $policy = PrivacyPolicy::findOrFail($id);
        return view('admin.pages.privacy.edit', compact('policy'));
    }

    // Update Policy
    public function update(Request $request, $id)
    {
        $policy = PrivacyPolicy::findOrFail($id);

        $policy->update($request->all());

        return redirect()->route('privacy.index')
            ->with('success', 'Privacy Policy updated successfully.');
    }

    // Delete Policy
    public function destroy($id)
    {
        PrivacyPolicy::findOrFail($id)->delete();
        return back()->with('success', 'Policy deleted successfully.');
    }

    // Frontend View
    public function showFrontend()
    {
        $policies = PrivacyPolicy::all();
        return view('frontend.privacy', compact('policies'));
    }
}
