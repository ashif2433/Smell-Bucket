<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>{{ config('app.name') }} | @yield('title')</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="keywords" content="Sabbir emplate" />
    <meta name="description" content="{{ config('app.name') }}">
    <meta name="author" content="Sabbir Ahmmed">
    <meta name="contact" content="01751155302">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="{{ asset('frontend/fav1.png') }}">


    <script type="text/javascript">
        WebFontConfig = {
            google: {
                families: ['Open+Sans:300,400,600,700', 'Poppins:300,400,500,600,700,800', 'Playfair+Display:900']
            }
        };
        (function(d) {
            var wf = d.createElement('script'),
                s = d.scripts[0];
            wf.src = '{{ asset('frontend/assets/js/webfont.js') }}';
            wf.async = true;
            s.parentNode.insertBefore(wf, s);
        })(document);
    </script>

    @php
        use App\Models\Category;
        $menu = Category::where('status', 'active')->take(8)->get();
    @endphp

    @php
        use App\Models\PixelGtm;
        $data = PixelGtm::first();
    @endphp


    @if (!empty($data->pixel))
        <!-- Facebook Pixel Code -->
        <script>
            ! function(f, b, e, v, n, t, s) {
                if (f.fbq) return;
                n = f.fbq = function() {
                    n.callMethod ?
                        n.callMethod.apply(n, arguments) : n.queue.push(arguments)
                };
                if (!f._fbq) f._fbq = n;
                n.push = n;
                n.loaded = !0;
                n.version = '2.0';
                n.queue = [];
                t = b.createElement(e);
                t.async = !0;
                t.src = v;
                s = b.getElementsByTagName(e)[0];
                s.parentNode.insertBefore(t, s)
            }(window, document, 'script',
                'https://connect.facebook.net/en_US/fbevents.js');
            fbq('init', '{{ $data->pixel }}'); // Dynamically insert Pixel ID
            fbq('track', 'PageView');
        </script>
        <noscript>
            <img height="1" width="1" style="display:none"
                src="https://www.facebook.com/tr?id={{ $data->pixel }}&ev=PageView&noscript=1" />
        </noscript>
        <!-- End Facebook Pixel Code -->
    @endif


    @if (!empty($data->gtm))
        <!-- Google Tag Manager -->
        <script>
            (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;
            j.src='https://www.googletagmanager.com/gtm.js?id={{ $data->gtm }}'+dl;
            f.parentNode.insertBefore(j,f);
            })(window,document,'script','dataLayer','{{ $data->gtm }}');
        </script>
        <!-- End Google Tag Manager -->
    @endif



    {{-- <link rel="stylesheet" href="{{ asset('frontend/assets/css/toastr.min.css') }}"> --}}

    {{-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/dataTables.bootstrap5.min.css') }}">
    <link rel="stylesheet" type="text/css"
    href="{{ asset('frontend/assets/vendor/fontawesome-free/css/all.min.css') }}">
    <link rel="stylesheet" type="text/css"
    href="{{ asset('frontend/assets/vendor/simple-line-icons/css/simple-line-icons.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('frontend/assets/css/custom.css') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"> --}}

    <style>
        .side-nav ul li {
            list-style: none;
        }
        .side-nav ul li a{
            color: rgb(68, 67, 67);
            font-weight: 600;
        }
        .tawk-icon-right {
            display: none !important;
        }

        .brand_link img {
            max-width: 230px;
            /* aspect-ratio: 7 / 2; */
        }

        .backtotop2{
            right: 15px;
            width: 50px;
            height: 50px;
            z-index: 999;
            bottom: 115px;
            font-size: 16px;
            position: fixed;
            border-radius: 100%;
            box-shadow: 0px 10px 30px 1px rgba(0, 0, 0, 0.15);
            display: block;
            background-color: #0CC143;
        }

        .backtotop2 a {
            z-index: 1;
            width: 100%;
            height: 100%;
            display: flex;
            color: #ffffff;
            position: relative;
            align-items: center;
            justify-content: center;
        }

        @media only screen and (max-width: 600px) {
            .brand_link img {
                max-width: 150px;
                /* aspect-ratio: 7 / 2; */
            }
        }
    </style>

    {{-- new --}}


    {{-- <link rel="shortcut icon" href="{{ asset('assets/images/logo/favourite_icon_01.png') }}"> --}}
    {{-- <link rel="shortcut icon" href="{{ asset('') . $websiteInfo->logo }}"> --}}


    <!-- fraimwork - css include -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/bootstrap.min.css') }}">

    <!-- icon - css include -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/fontawesome.css') }}">

    <!-- animation - css include -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/animate.css') }}">

    <!-- nice select - css include -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/nice-select.css') }}">

    <!-- carousel - css include -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/slick.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/slick-theme.css') }}">

    <!-- popup images & videos - css include -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/magnific-popup.css') }}">

    <!-- jquery ui - css include -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/jquery-ui.css') }}">

    <!-- custom - css include -->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/style.css') }}">

    <link rel="stylesheet" href="{{ asset('frontend/assets/css/style.min.css') }}">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />

    @stack('css')
</head>

{{-- <body> --}}

<body class="home_fashion">

    @if (!empty($data->gtm))
        <!-- Google Tag Manager (noscript) -->
        <noscript>
            <iframe src="https://www.googletagmanager.com/ns.html?id={{ $data->gtm }}"
                    height="0" width="0" style="display:none;visibility:hidden"></iframe>
        </noscript>
        <!-- End Google Tag Manager (noscript) -->
    @endif

    <!-- backtotop - start -->
    <div id="thetop"></div>
    <div class="backtotop bg_fashion_red">
        <a href="#" class="scroll">
            <i class="far fa-arrow-up"></i>
        </a>
    </div>
    <div class="backtotop2">
        <a href="https://wa.me/{{ $websiteInfo->contact_no }}">
            <i class="fab fa-whatsapp fa-2x"></i>
        </a>
    </div>
    <!-- backtotop - end -->

    <header class="header_section fashion_header sticky_header clearfix">
        <div class="header_content_wrap clearfix">
            <div class="container-fluid prl_60">
                <div class="row align-items-center justify-content-lg-between w-100">
                    <div class="col-6">
                        <div class="brand_logo">
                            <a class="brand_link" href="{{ route('index') }}">
                                <img src="{{ asset('') . $websiteInfo->logo }}"
                                    srcset="{{ asset('') . $websiteInfo->logo }}" alt="logo_not_found">
                            </a>
                        </div>
                    </div>

                    <div class="col-6">
                        <ul class="action_btns_group ul_li_right clearfix">
                            <li>
                                <button type="button" class="mobile_menu_btn"><i class="far fa-bars"></i></button>
                            </li>
                            <li>
                                <button type="button" class="search_btn" data-toggle="collapse"
                                    data-target="#search_body_collapse" aria-expanded="false"
                                    aria-controls="search_body_collapse">
                                    <i class="fal fa-search"></i>
                                </button>
                            </li>
                            <li>
                                <button type="button" class="cart_btn">
                                    <i class="fal fa-shopping-cart"></i>
                                    <span class="btn_badge">{{ \Cart::content()->count() }}</span>
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div id="search_body_collapse" class="search_body_collapse collapse">
            <div class="search_body">
                <div class="container-fluid prl_90">
                    <form action="{{ route('product.search') }}" method="get">
                        <div class="header-search-wrapper">
                            <input type="search" class="form-control" name="search_text" id="search_text"
                                placeholder="Search..." required>
                            <button class="btn p-0 icon-search-3" name="" type="submit"></button>
                        </div>
                        <div class="search_result d-none d-lg-block"></div>
                    </form>
                </div>
            </div>
        </div>
    </header>


    {{-- <div class="page-wrapper"> --}}

    {{-- @include('frontend.components.header') --}}

    <main>
        <!-- sidebar mobile menu & sidebar cart - start
   ================================================== -->
        <div class="sidebar-menu-wrapper">
            <div class="cart_sidebar">
                <button type="button" class="close_btn"><i class="fal fa-times"></i></button>

                @if (Cart::content()->count() != 0)
                    <ul class="cart_items_list ul_li_block mb_30 clearfix">
                        @foreach (\Cart::content()->toArray() as $cartitem)
                            <li>
                                <div class="item_image">
                                    <a href="{{ route('product', $cartitem['id']) }}" class="product-image">
                                        <img src="{{ isset($cartitem['options']['thumbnail']) && is_array($decodedThumbnail = json_decode($cartitem['options']['thumbnail'], true)) ? singlePhoto($decodedThumbnail) : '' }}"
                                            alt="product">
                                    </a>
                                </div>
                                <div class="item_content">
                                    <h4 class="item_title">
                                        <a href="{{ route('product', $cartitem['id']) }}">
                                            {{ $cartitem['name'] }}</a>

                                    </h4>
                                    <span class="item_price">{{ $cartitem['qty'] }} x {{ $cartitem['price'] }}</span>
                                </div>
                                <a href="{{ route('cart.remove', $cartitem['rowId']) }}"
                                    class="btn-remove icon-cancel remove_btn" title="Remove Product"><i
                                        class="fal fa-trash-alt"></i>
                                </a>
                            </li>
                        @endforeach

                    </ul>

                    <ul class="total_price ul_li_block mb_30 clearfix">
                        <li>
                            <span>Total:</span>
                            <span>&#2547; {{ \Cart::subtotal() }}</span>
                        </li>
                    </ul>

                    <ul class="btns_group ul_li_block clearfix">
                        <li><a href="{{ route('customer.checkout') }}">Checkout</a></li>
                    </ul>
                @else
                    <ul class="btns_group ul_li_block clearfix">
                        <li>Cart is Empty</li>
                    </ul>
                @endif
            </div>

            <div class="sidebar_mobile_menu">
                <button type="button" class="close_btn"><i class="fal fa-times"></i></button>

                <div class="msb_widget brand_logo text-center">
                    <a href="{{ route('index') }}" style="max-width: 230px">
                        <img src="{{ asset('') . $websiteInfo->logo }}"
                            srcset="{{ asset('') . $websiteInfo->logo }}" alt="logo_not_found">
                    </a>
                </div>

                <div class="msb_widget mobile_menu_list clearfix">
                    <h3 class="title_text mb_15 text-uppercase"><i class="far fa-bars mr-2"></i> Menu List</h3>
                    <ul class="ul_li_block clearfix">
                        @foreach ($menu as $item)
                            <li><a href="{{ route('product.bycategory', $item->id) }}">{{ $item->name }}</a></li>
                        @endforeach
                        {{-- <nav class="side-nav">
                            {!! frontendCategories($menucategories) !!}
                        </nav> --}}

                    </ul>
                </div>

                {{-- <div class="user_info">
                    <h3 class="title_text mb_30 text-uppercase"><i class="fas fa-user mr-2"></i> User Info</h3>
                    <div class="profile_info clearfix">
                        <div class="user_thumbnail">
                            <img src="assets/images/meta/img_01.png" alt="thumbnail_not_found">
                        </div>
                        <div class="user_content">
                            <h4 class="user_name">Jone Doe</h4>
                            <span class="user_title">Seller</span>
                        </div>
                    </div>
                    <ul class="settings_options ul_li_block clearfix">
                        <li><a href="#!"><i class="fal fa-user-circle"></i> Profile</a></li>
                        <li><a href="#!"><i class="fal fa-user-cog"></i> Settings</a></li>
                        <li><a href="#!"><i class="fal fa-sign-out-alt"></i> Logout</a></li>
                    </ul>
                </div> --}}
            </div>

            <div class="overlay"></div>
        </div>
        <!-- sidebar mobile menu & sidebar cart - end
   ================================================== -->
        @yield('content')
    </main>

    @include('frontend.components.footer')



    <script src="{{ asset('frontend/assets/js/jquery.min.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
    <script src="{{ asset('frontend/assets/js/plugins.min.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="{{ asset('frontend/assets/js/toastr.min.js') }}"></script>
    <script src="{{ asset('frontend/assets/js/main.min.js') }}"></script>
    <script src="{{ asset('frontend/assets/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('frontend/assets/js/dataTables.bootstrap5.min.js') }}"></script>
    <script src="{{ asset('frontend/custom.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>
        @if (Session::has('success'))
            toastr.success("{{ Session::get('success') }}");
        @endif
        @if (Session::has('error'))
            toastr.error("{{ Session::get('error') }}");
        @endif
        @if (Session::has('warning'))
            toastr.warning("{{ Session::get('warning') }}");
        @endif
        @if (Session::has('info'))
            toastr.info("{{ Session::get('info') }}");
        @endif
    </script>



    {{-- new --}}

    <!-- fraimwork - jquery include -->
    <script src="{{ asset('assets/js/jquery-3.5.1.min.js') }}"></script>
    <script src="{{ asset('assets/js/popper.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>

    <!-- mobile menu - jquery include -->
    <script src="{{ asset('assets/js/mCustomScrollbar.js') }}"></script>

    <!-- google map - jquery include -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk2HrmqE4sWSei0XdKGbOMOHN3Mm2Bf-M&ver=2.1.6"></script>
    <script src="{{ asset('assets/js/gmaps.min.js') }}"></script>

    <!-- animation - jquery include -->
    <script src="{{ asset('assets/js/parallaxie.js') }}"></script>
    <script src="{{ asset('assets/js/wow.min.js') }}"></script>

    <!-- nice select - jquery include -->
    <script src="{{ asset('assets/js/nice-select.min.js') }}"></script>

    <!-- carousel - jquery include -->
    <script src="{{ asset('assets/js/slick.min.js') }}"></script>

    <!-- countdown timer - jquery include -->
    <script src="{{ asset('assets/js/countdown.js') }}"></script>

    <!-- popup images & videos - jquery include -->
    <script src="{{ asset('assets/js/magnific-popup.min.js') }}"></script>

    <!-- filtering & masonry layout - jquery include -->
    <script src="{{ asset('assets/js/isotope.pkgd.min.js') }}"></script>
    <script src="{{ asset('assets/js/masonry.pkgd.min.js') }}"></script>
    <script src="{{ asset('assets/js/imagesloaded.pkgd.min.js') }}"></script>

    <!-- jquery ui - jquery include -->
    <script src="{{ asset('assets/js/jquery-ui.js') }}"></script>

    <!-- custom - jquery include -->
    <script src="{{ asset('assets/js/custom.js') }}"></script>

    @stack('js')
</body>

</html>
