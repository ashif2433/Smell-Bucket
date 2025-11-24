@extends('frontend.components.layout')

@section('content')

<style>
    .contact-header {
        font-size: 32px;
        font-weight: 700;
        margin-bottom: 20px;
    }
    .contact-box {
        background: #ffffff;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        transition: 0.3s;
    }
    .contact-box:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    .contact-info-title {
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 10px;
    }
    .info-line {
        margin-bottom: 8px;
        font-size: 15px;
    }
    .info-line i {
        color: #007BFF;
        margin-right: 8px;
    }
    .social-links a {
        display: block;
        margin-bottom: 6px;
        text-decoration: none;
        font-weight: 500;
        transition: 0.3s;
    }
    .social-links a:hover {
        color: #0056b3;
        padding-left: 5px;
    }
    .msg-box {
        background: #ffffff;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.05);
    }
</style>

<div class="container py-5"">

    <h1 class="contact-header" style="padding-top: 60px">Contact Us</h1>

    <div class="row">

        <!-- Contact Info -->
        <div class="col-md-4">
            <div class="contact-box">

                <p class="contact-info-title">Company Information</p>

                <div class="info-line">
                    <i class="fa fa-map-marker"></i>
                    {{ $info->address }}
                </div>

                <div class="info-line">
                    <i class="fa fa-envelope"></i>
                    {{ $info->email }}
                </div>

                <div class="info-line">
                    <i class="fa fa-phone"></i>
                    {{ $info->contact_no }}
                </div>

                <hr>

                <p class="contact-info-title mt-3">Social Links</p>

                <div class="social-links">
                    <a href="{{ $info->facebook }}" target="_blank"><i class="fab fa-facebook"></i> Facebook</a>
                    <a href="{{ $info->google_business }}" target="_blank"><i class="fa fa-briefcase"></i></i> Google Business</a>
                    <a href="{{ $info->youtube }}" target="_blank"><i class="fab fa-youtube"></i> YouTube</a>
                    <a href="{{ $info->tiktok }}" target="_blank"><i class="fab fa-tiktok"></i> TikTok</a>

                </div>

            </div>
        </div>

        <!-- Contact Form -->
        <div class="col-md-8">
            <div class="msg-box">

                <h4 class="mb-3" style="font-weight:700;">Send Us a Message</h4>

                @if(session('success'))
                    <div class="alert alert-success">{{ session('success') }}</div>
                @endif

                <form action="{{ route('contact.send') }}" method="POST">
                    @csrf

                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Your Name">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" placeholder="Your Email">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Message</label>
                        <textarea name="message" rows="4" class="form-control" placeholder="Write your message..."></textarea>
                    </div>

                    <button class="btn btn-primary px-4 py-2">Send Message</button>

                </form>

            </div>
        </div>

    </div>
</div>

@endsection

