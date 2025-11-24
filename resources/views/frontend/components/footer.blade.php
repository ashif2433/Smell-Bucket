@php
    use App\Models\Category;
    $menu = Category::where('status', 'active')->take(7)->get();
@endphp

<footer class="footer_section carparts_footer text-white clearfix">
    <div class="footer_widget_area sec_ptb_100 clearfix" data-bg-color="#131313">
        <div class="container">
            <div class="row justify-content-lg-between">

                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                    <div class="footer_widget footer_about">
                        <div class="brand_logo mb_30">
                            <a href="{{ route('index') }}">
                                <img src="{{ asset('') . $websiteInfo->logo }}"
                                    srcset="{{ asset('') . $websiteInfo->logo }}" alt="logo_not_found"
                                    style="width: 75%; background: #fff;padding: 10px 10px;">
                            </a>
                        </div>

                        <p>{{ config('app.name') }} — Your trusted destination for quality products, unbeatable deals,
                            and smooth shopping experiences, all in one place.</p>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                    <div class="footer_widget footer_useful_links clearfix">
                        <h3 class="footer_widget_title text-white">Find it Fast</h3>
                        <ul class="ul_li_block">
                            @foreach ($menu as $item)
                                <li><a href="{{ route('product.bycategory', $item->id) }}">{{ $item->name }}</a></li>
                            @endforeach
                            <li><a href="{{ route('contact.page') }}">Contact</a></li>
                            <li><a href="{{ route('privacy.policy') }}">Privacy Policy</a></li>

                        </ul>
                    </div>
                </div>
                {{-- <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                    <div class="footer_widget footer_useful_links clearfix">
                        <h3 class="footer_widget_title text-white">Find it Fast</h3>
                        <ul class="ul_li_block">
                            @foreach ($menu as $item)
                                <li><a href="{{ route('privacy.policy') }}">Privacy Policy</a></li>

                            @endforeach
                        </ul>
                    </div>
                </div> --}}

                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                    <div class="footer_widget footer_useful_links clearfix">
                        <h3 class="footer_widget_title text-white">Contact </h3>
                        <ul class="ul_li_block d-flex">
                            <li style=""><a href="{{ $websiteInfo->facebook }}"><i
                                        class="fab fa-facebook-square fa-2x"></i></a></li>
                            <li style="padding-left:10px"><a href="{{ $websiteInfo->google_business }}"><i
                                        class="fab fa-google fa-2x"></i></a></li>
                            <li style="padding-left:10px"><a href="{{ $websiteInfo->youtube }}"><i
                                        class="fab fa-youtube fa-2x"></i></a></li>
                            <li style="padding-left:10px"><a href="{{ $websiteInfo->tiktok }}"><i
                                        class="fab fa-tiktok fa-2x"></i></a></li>
                        </ul>
                    </div>
                    <div class="footer_carparts_hotline mt-2">
                        {{-- <h4><span style="color:#ed1d24">Got questions? Call us</span></h4> --}}
                        <h4><span style="color:#ed1d24">{{ $websiteInfo->working_hours }}</span></h4>
                        <span>{{ $websiteInfo->contact_no }}</span>
                        <a href="{{ asset('app/smellbucket.apk') }}" download="smellbucket.apk">
                            <img class="mt-3" src="{{ asset('assets/downloadapp.PNG') }}" alt="img"
                                style="width: 190px; aspect-ratio: 5/2;">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer_bottom clearfix" data-bg-color="#000000">
        <div class="container">
            <div class="row align-items-center justify-content-lg-between">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p class="text-center copyright_text mb-0">© {{ config('app.name') }}
                        Powered By
                        <a
                            href="https://www.startupmind.net/" class="author_link text-white">Startup Mind Technology
                            LTD.
                        </a>
                         - All rights Reserved
                    </p>
                    {{-- <p class="text-center copyright_text mb-0"><a href="{{ route('privacy.policy') }}" class="author_link text-white">Privacy Policy</a></p> --}}
                </div>
            </div>
        </div>
    </div>


</footer>
