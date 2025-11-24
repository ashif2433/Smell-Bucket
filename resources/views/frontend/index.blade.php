@extends('frontend.components.layout')

@section('title')
    Home
@endsection

@push('css')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

    <style>
        .sidebar-toggle {
            display: none;
        }

        #hometex {
            display: flex !important;
        }

        .hometexbtn {
            color: #000000ad;
        }

        .hometexbtn:hover {
            background-color: rgba(16, 88, 14, 0.493);
            color: #fff;
        }

        #heroimage {
            height: 900px;
        }

        #singleimg {
            aspect-ratio: 5 / 2;
            width: 100%;
        }

        .banner-height {
            a
        }


        @media only screen and (max-width: 1500px) {
            #heroimage {
                height: 750px;
            }

            #singleimg {
                aspect-ratio: 5 / 2;
                object-fit: cover;
            }
        }

        @media only screen and (min-width: 1300px) {
            .banner-height {
                height: 88vh;
            }
            .banner-height img{
                height: 100%;
            }
        }
        @media only screen and (max-width: 1300px) {
            #heroimage {
                height: 500px;
            }

            #singleimg {
                aspect-ratio: 5 / 2;
                object-fit: cover;
            }
        }

        @media only screen and (max-width: 1000px) {
            #heroimage {
                height: 550px;
            }

            #singleimg {
                aspect-ratio: 5 / 3;
                object-fit: cover;
            }
        }

        @media only screen and (max-width: 768px) {
            #heroimage {
                height: 450px;
            }

            #singleimg {
                aspect-ratio: 5 / 3;
                object-fit: cover;
            }

            /* .fashion_instagram img {
                height: 130px;
            } */

            .fashion_instagram img {
                height: 130px;        /* make it fill the box */
                object-fit: cover;    /* zoom + crop to fill space */
                width: 100%;
                    }
        }
    </style>
@endpush

@section('content')
    {{-- <div class="container mb-2">

        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12 d-none d-lg-block">
                        <div class="container justify-content-center align-items-center"
                            style="background-color: rgb(95 95 95 / 11%);" id="hometex">
                            @foreach ($menu as $item)
                                <a href="{{ route('product.bycategory', $item->id) }}" class="hometexbtn"
                                    style="padding: 10px 15px;">{{ $item->name }}</a>
                            @endforeach
                        </div>

                    </div>
                    <div class="col-lg-12">
                        <div class="swiper bannersnew">
                            <div class="swiper-wrapper">
                                @foreach ($sliders as $item)
                                    <div class="swiper-slide {{ $loop->index == 0 ? 'active' : '' }}">
                                        <a href="{{ $item->link }}">
                                            <img src="{{ asset('') . $item->image }}" class="d-block w-100" alt="...">
                                        </a>
                                    </div>
                                @endforeach
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>

                    </div>
                    <div class="sidebar-overlay"></div>
                    <div class="sidebar-toggle"><i class="fas fa-sliders-h"></i></div>
                    <aside class="sidebar-home col-lg-3 order-lg-first mobile-sidebar d-none">
                        <div class="side-menu-wrapper mb-2 d-none d-lg-block">
                            <h2 class="side-menu-title bg-gray ls-n-25">Browse Categories</h2>

                            <nav class="side-nav">
                                {!! frontendCategories($menucategories) !!}
                            </nav>
                        </div>
                    </aside>
                </div>


                <section class="mb-2 py-2 bg-light">
                    <div class="auto-container">
                        <div class="container my-5">
                            <div class="swiper mySwiperSecure">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="col px-3">
                                            <div class="d-flex justify-content-center">
                                                <div class="text-center px-3">
                                                    <i style="color: #4bc778;font-size: 3.5rem;"
                                                        class="fas fa-money-check"></i>
                                                </div>
                                                <div class="small" style="width: 100px">100% Payment Secured</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="col px-3">
                                            <div class="d-flex justify-content-center">
                                                <div class="text-center px-3">
                                                    <i style="color: #4bc778;font-size: 3.5rem;" class="fas fa-wallet"></i>
                                                </div>
                                                <div class="small" style="width: 100px">Support lots of Payments</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="col px-3">
                                            <div class="d-flex justify-content-center">
                                                <div class="text-center px-3">
                                                    <i style="color: #4bc778;font-size: 3.5rem;" class="fas fa-truck"></i>
                                                </div>
                                                <div class="small" style="width: 100px">Free Delivery</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="col px-3">
                                            <div class="d-flex justify-content-center">
                                                <div class="text-center px-3">
                                                    <i style="color: #4bc778;font-size: 3.5rem;" class="fas fa-headset"></i>
                                                </div>
                                                <div class="small" style="width: 100px">24hours/7days Support</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="col px-3">
                                            <div class="d-flex justify-content-center">
                                                <div class="text-center px-3">
                                                    <i style="color: #4bc778;font-size: 3.5rem;" class="fas fa-tag"></i>
                                                </div>
                                                <div class="small" style="width: 100px">Best Price Guaranteed</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="col px-3">
                                            <div class="d-flex justify-content-center">
                                                <div class="text-center px-3">
                                                    <i style="color: #4bc778;font-size: 3.5rem;" class="fab fa-android"></i>
                                                </div>
                                                <div class="small" style="width: 100px">Mobile Apps Ready</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div id="search-content">

                    <section class="py-3">
                        <div class="container my-5">
                            <h4 class="fw-bold mb-1">Shop by Categories</h4>
                            <div class="swiper shopcat">
                                <div class="swiper-wrapper">
                                    @foreach ($categories as $category)
                                        <div class="swiper-slide">
                                            <div class="">
                                                <a href="{{ route('product.bycategory', $category->id) }}">
                                                    <div class="card h-100 col d-flex flex-column align-items-center my-3"
                                                        style="background-color: {{ getAnyColor($loop->index) }};">
                                                        <div class="">
                                                            <img src="{{ asset($category->image) }}" alt=""
                                                                style="aspect-ratio: 3 / 2;">
                                                            <div class="d-flex justify-content-center align-items-center flex-column"
                                                                style="height: 50px">
                                                                <p
                                                                    class="p-0 m-0 text-center text-uppercase pt-1 text-dark small">
                                                                    {{ $category->name }}</p>
                                                                <p class="p-0 m-0 small text-center pb-1">
                                                                    {{ $category->products_count . ' products' }}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    @endforeach

                                </div>
                            </div>

                        </div>
                    </section>
                </div>
                </section>

                <h4 class="fw-bold mb-1">Most Selling Categories</h4>
                <div class="banners-container m-b-2 owl-carousel owl-theme"
                    data-owl-options="{'dots': false,'margin': 20,'loop': false,'responsive': {'480': {'items': 2},'768': {'items': 3}}}">
                    @foreach ($banners as $banner)
                        <div class="banner banner1 banner-hover-shadow mb-2">
                            <a href="{{ $banner->link }}">
                                <figure>
                                    <img src="{{ asset('') . $banner->image }}" alt="banner">
                                </figure>
                                <div class="banner-layer banner-layer-middle">
                                </div>
                            </a>
                        </div>
                    @endforeach
                </div>

                @foreach ($sections as $section)
                    <section class="py-3">
                        <div class="auto-container">
                            <div class="container my-5">
                                <h4 class="fw-bold m-0">{{ $section->name }}</h4>
                                <div class="swiper mySwiper">
                                    <div class="swiper-wrapper">
                                        @foreach ($section->products->take(10) as $product)
                                            <div class="swiper-slide">
                                                <div class="">
                                                    <div
                                                        class="card h-100 col d-flex flex-column align-items-center product-item my-3">
                                                        <a href="{{ route('product', $product->id) }}">
                                                            <div class="product">
                                                                <img src="{{ is_array(json_decode($product->thumbnail)) ? singlePhoto(json_decode($product->thumbnail)) : '' }}"
                                                                    alt=""
                                                                    style="max-width:175px;margin: 0px auto;">
                                                                <ul
                                                                    class="d-flex align-items-center justify-content-center list-unstyled icons">
                                                                    <a href="" class="add-wishlist"
                                                                        data-id = "{{ $product->id }}">
                                                                        <li class="icon mx-3"><span
                                                                                class="far fa-heart"></span></li>
                                                                    </a>


                                                                    <a href="{{ route('product', $product->id) }}">
                                                                        <li class="icon"><span
                                                                                class="fas fa-eye"></span></li>
                                                                    </a>
                                                                </ul>
                                                            </div>
                                                            <div class="card-title pt-4 pb-1 px-2">{{ $product->name }}
                                                            </div>
                                                            <div
                                                                class="d-flex align-content-center justify-content-center">

                                                                @for ($i = 0; $i < $product->rating; $i++)
                                                                    <span class="fas fa-star"
                                                                        style="color: rgb(23, 92, 20);"></span>
                                                                @endfor

                                                                @for ($i = $product->rating; $i < 5; $i++)
                                                                    <span class="fas fa-star"
                                                                        style="color: rgba(107, 107, 107, 0.384);"></span>
                                                                @endfor



                                                            </div>

                                                            <div class="price">
                                                                @if ($product->discount_price > 0 && $product->selling_price > $product->discount_price)
                                                                    <span style="padding-right: 10px">
                                                                        <del class="price text-danger">&#2547;
                                                                            {{ number_format($product->selling_price, 2) }}</del>
                                                                    </span>
                                                                    <span class="text-success">&#2547;
                                                                        {{ number_format($product->selling_price - $product->discount_price, 2) }}</span>
                                                                @else
                                                                    <span class="text-success">&#2547;
                                                                        {{ number_format($product->selling_price, 2) }}</span>
                                                                @endif
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>
                        </div>
                    </section>
                @endforeach


                <section class="">
                    <div class="container ninesection my-5">
                        <h4 class="fw-bold m-0">New Arrivals</h4>

                        <div class="auto-container">
                            <div class="container my-5">
                                <div class="swiper mySwiper">
                                    <div class="swiper-wrapper">
                                        @foreach ($sectionsNew[0]->products->take(10) as $product)
                                            <div class="swiper-slide">
                                                <div class="">
                                                    <div
                                                        class="card h-100 col d-flex flex-column align-items-center product-item my-3">
                                                        <a href="{{ route('product', $product->id) }}">
                                                            <div class="product">
                                                                <img src="{{ is_array(json_decode($product->thumbnail)) ? singlePhoto(json_decode($product->thumbnail)) : '' }}"
                                                                    alt=""
                                                                    style="max-width:175px;margin: 0px auto;">
                                                                <ul
                                                                    class="d-flex align-items-center justify-content-center list-unstyled icons">
                                                                    <a href="" class="add-wishlist"
                                                                        data-id = "{{ $product->id }}">
                                                                        <li class="icon mx-3"><span
                                                                                class="far fa-heart"></span></li>
                                                                    </a>


                                                                    <a href="{{ route('product', $product->id) }}">
                                                                        <li class="icon"><span
                                                                                class="fas fa-eye"></span></li>
                                                                    </a>
                                                                </ul>
                                                            </div>
                                                            <div class="card-title pt-4 pb-1 px-2">{{ $product->name }}
                                                            </div>
                                                            <div
                                                                class="d-flex align-content-center justify-content-center">
                                                                @for ($i = 0; $i < $product->rating; $i++)
                                                                    <span class="fas fa-star"
                                                                        style="color: rgb(23, 92, 20);"></span>
                                                                @endfor

                                                                @for ($i = $product->rating; $i < 5; $i++)
                                                                    <span class="fas fa-star"
                                                                        style="color: rgba(107, 107, 107, 0.384);"></span>
                                                                @endfor
                                                            </div>

                                                            <div class="price">

                                                                @if ($product->discount_price > 0 && $product->selling_price > $product->discount_price)
                                                                    <span style="padding-right: 10px">
                                                                        <del class="price text-danger">&#2547;
                                                                            {{ number_format($product->selling_price, 2) }}</del>
                                                                    </span>
                                                                    <span class="text-success">&#2547;
                                                                        {{ number_format($product->selling_price - $product->discount_price, 2) }}</span>
                                                                @else
                                                                    <span class="text-success">&#2547;
                                                                        {{ number_format($product->selling_price, 2) }}</span>
                                                                @endif
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>
                        </div>



                    </div>
                </section>

                <section class="my-3">
                    <p class="fw-bold mb-2 text-center WhereMagic">Where Magic Happens</p>
                    <h4 class="fw-bold mb-2 text-center">{{ $singleBanner->name }}</h4>
                    <div class="row">
                        <a class="tokoo-banner-link">
                            <img src="{{ asset('') . $singleBanner->image }}" class="img-fluid" alt=""
                                style="aspect-ratio: 5 / 1;">
                        </a>
                    </div>
                </section>

                <section class="my-3 mt-5">
                    <h4 class="fw-bold mb-2 text-center WhereMagic">Our Happy Customer</h4>
                    <div class="swiper HappyCustomer">
                        <div class="swiper-wrapper">
                            @foreach ($creviews as $creview)
                                <div class="swiper-slide">
                                    <div class="card h-100 col d-flex flex-column align-items-center my-3 p-5"
                                        style="background-color: #e7e5e540">
                                        <img src="{{ asset('frontend/img/quote_icon.png') }}" alt="">
                                        <p class="mt-3"><i>"
                                                {{ \Illuminate\Support\Str::words($creview->review, 30, '...') }} "</i></p>
                                        <div class="d-flex flex-row align-items-center justify-content-center w-100">
                                            <img src="{{ asset('') . $creview->image }}" class="" alt="..."
                                                style="height: 70px; width:70px; border-radius:50%">
                                            <div class="px-3">
                                                <h5 class="card-title">{{ $creview->name }}</h5>
                                                <p class="card-text">{{ $creview->designation }}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </section>

                <section class="py-3">
                    <div class="container my-5">
                        <h4 class="fw-bold mb-1 text-center WhereMagic">We are Brand</h4>
                        <div class="swiper card brandw mt-3 p-3">
                            <div class="swiper-wrapper">
                                @foreach ($webrand as $item)
                                    <div class="swiper-slide">
                                        <img src="{{ asset('frontend/img/' . $item->img) }}" alt=""
                                            style="aspect-ratio: 8 / 8;">
                                    </div>
                                @endforeach

                            </div>
                        </div>

                    </div>
                </section>

                <hr class="mt-1 mb-4">

                <div class="feature-boxes-container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="feature-box px-sm-3 feature-box-simple text-center">
                                <i class="icon-earphones-alt"></i>
                                <div class="feature-box-content">
                                    <h3 class="m-b-1">Customer Support</h3>
                                    <h5 class="m-b-3">Need Assistance?</h5>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="feature-box px-sm-3 feature-box-simple text-center">
                                <i class="icon-credit-card"></i>
                                <div class="feature-box-content">
                                    <h3 class="m-b-1">Secured Payment</h3>
                                    <h5 class="m-b-3">Safe & Fast</h5>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="feature-box px-sm-3 feature-box-simple text-center">
                                <i class="icon-action-undo"></i>
                                <div class="feature-box-content">
                                    <h3 class="m-b-1">Returns</h3>
                                    <h5 class="m-b-3">Easy & Free</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --}}

    <section class="slider_section fashion_slider position-relative clearfix" style="margin-top: 115px">
        <div class="col-lg-12">
            <div class="swiper bannersnew">
                <div class="swiper-wrapper">
                    @foreach ($sliders as $item)
                        <div class="swiper-slide {{ $loop->index == 0 ? 'active' : '' }}">
                            <a href="{{ $item->link }}" class="w-100 banner-height">
                                <img src="{{ asset('') . $item->image }}" class="d-block w-100 h-md-100 h-lg-100" alt="...">
                            </a>
                        </div>
                    @endforeach
                </div>
                <div class="swiper-button-next d-none d-md-block"></div>
                <div class="swiper-button-prev d-none d-md-block"></div>
            </div>
        </div>
    </section>

    <section class="category_section sec_ptb_50 clearfix">
        <div class="container">
            <div class="swiper shopcat">
                <div class="swiper-wrapper">
                    @foreach ($categories as $category)
                        <div class="swiper-slide">
                            <div class="fashion_category_circle">
                                <div class="item_image">
                                    <img src="{{ asset($category->image) }}" alt="image_not_found">
                                    <a class="icon_btn bg_fashion_red"
                                        href="{{ route('product.bycategory', $category->id) }}"><i
                                            class="fal fa-arrow-right"></i></a>
                                </div>
                                <div class="item_content text-uppercase">
                                    <h3 class="item_title">{{ $category->name }}</h3>
                                    <span class="item_instock">{{ $category->products_count . ' products' }} ITEMS</span>
                                </div>
                            </div>
                        </div>
                    @endforeach

                </div>
            </div>
        </div>
    </section>


    <section class="feature_section clearfix">
        <div class="container-fluid prl_60">
            <a href="{{ $singleBanner->link }}" style="width:100%">
                <img src="{{ asset('') . $singleBanner->image }}" class="img-fluid" alt="" id="singleimg">
            </a>
        </div>
    </section>

    <section class="product_section clearfix">
        <div class="container">
            @foreach ($sections as $section)
                @php
                    $sliderClass =
                        'slideshow' .
                        ($section->serial === 1
                            ? 'a'
                            : ($section->serial === 2
                                ? 'b'
                                : ($section->serial === 3
                                    ? 'c'
                                    : 'd'))) .
                        '_slider';
                    $sliderbtnleft =
                        'ss3_left_arrow' .
                        ($section->serial === 1
                            ? 'a'
                            : ($section->serial === 2
                                ? 'b'
                                : ($section->serial === 3
                                    ? 'c'
                                    : 'd')));
                    $sliderbtnright =
                        'ss3_right_arrow' .
                        ($section->serial === 1
                            ? 'a'
                            : ($section->serial === 2
                                ? 'b'
                                : ($section->serial === 3
                                    ? 'c'
                                    : 'd')));
                @endphp
                <div class="fashion_section_title sec_ptb_140 text-center mt-5 cpadding">
                    <h2 class="title_text mb_15">{{ $section->name }}</h2>
                </div>
                <div class="fp_popular_carousel arrow_ycenter py-2">
                    <div class="{{ $sliderClass }} row clearfix" data-slick='{"dots": false}'>
                        @foreach ($section->products->take(10) as $product)
                            <div class="item col">
                                <div class="fashion_product_item">
                                    <div class="item_image">
                                        <img src="{{ is_array(json_decode($product->thumbnail)) ? singlePhoto(json_decode($product->thumbnail)) : '' }}"
                                            alt="image_not_found">
                                        <ul class="product_action_btns ul_li_center clearfix">
                                            <li>
                                                <a class="addtocart_btn tooltips" data-placement="top" title="Buy Now"
                                                    href="{{ route('product', $product->id) }}">
                                                    <i class="fal fa-shopping-basket"></i> Buy
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="item_content">
                                        {{-- <span class="item_category text-uppercase">category</span> --}}
                                        <h3 class="item_title"><a
                                                href="{{ route('product', $product->id) }}">{{ $product->name }}</a></h3>
                                        <span class="item_price">
                                            @if ($product->discount_price > 0 && $product->selling_price > $product->discount_price)
                                                <span style="padding-right: 10px">
                                                    <del class="price text-danger">&#2547;
                                                        {{ number_format($product->selling_price, 2) }}</del>
                                                </span>
                                                <span class="text-success">&#2547;
                                                    {{ number_format($product->selling_price - $product->discount_price, 2) }}</span>
                                            @else
                                                <span class="text-success">&#2547;
                                                    {{ number_format($product->selling_price, 2) }}</span>
                                            @endif
                                        </span>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <div class="carousel_nav">
                        <button type="button" class="{{ $sliderbtnleft }}"><i class="fal fa-arrow-left"></i></button>
                        <button type="button" class="{{ $sliderbtnright }}"><i class="fal fa-arrow-right"></i></button>
                    </div>
                </div>
            @endforeach
        </div>
    </section>

    <div class="footer_section fashion_footer clearfix">
        <div class="fashion_newsletter_wrap sec_ptb_100 clearfix" data-bg-color="#ebfaff">
            <div class="container">
                <div
                    class="row align-items-center justify-content-lg-between justify-content-md-center justify-content-sm-center">
                    <div class="col-lg-6 col-md-7 col-sm-9 col-xs-12">
                        <div class="fashion_section_title">
                            <h2 class="title_text mb_15 text-uppercase">Get Discount 30% off</h2>
                            {{-- <h4 class="sub_title text-uppercase mb-0">Aenean feugiat libero ligula,</h4> --}}
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-7 col-sm-9 col-xs-12">
                        <div class="form_item mb-0">
                            <form action="{{ route('subscriberstore') }}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <input type="email" name="email" placeholder="enter email">
                                <button type="submit" class="submit_btn">Send Now</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <ul class=" clearfix banner-grid">
    @foreach ($banners as $banner)
        <li>
            <a href="{{ $banner->link }}">
                <img src="{{ asset('') . $banner->image }}" alt="image_not_found">
            </a>
        </li>
    @endforeach
</ul>

    </div>
@endsection


@push('js')
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <script>
        var swiper = new Swiper(".mySwiper", {
            autoplay: true,
            slidesPerView: 1,
            spaceBetween: 10,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            breakpoints: {
                0: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                540: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                640: {
                    slidesPerView: 3,
                    spaceBetween: 20,
                },
                900: {
                    slidesPerView: 4,
                    spaceBetween: 10,
                },
                1100: {
                    slidesPerView: 4,
                    spaceBetween: 10,
                },
                1200: {
                    slidesPerView: 5,
                    spaceBetween: 10,
                },
            },
        });


        var swiper = new Swiper(".mySwiperSecure", {
            autoplay: false,
            slidesPerView: 1,
            spaceBetween: 10,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            breakpoints: {
                0: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                540: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                640: {
                    slidesPerView: 3,
                    spaceBetween: 20,
                },
                900: {
                    slidesPerView: 4,
                    spaceBetween: 10,
                },
                1100: {
                    slidesPerView: 5,
                    spaceBetween: 10,
                },
                1200: {
                    slidesPerView: 6,
                    spaceBetween: 10,
                },
            },
        });


        var swiper = new Swiper(".bannersnew", {
            autoplay: true,
            slidesPerView: 1,
            spaceBetween: 10,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            },
            breakpoints: {
                0: {
                    slidesPerView: 1,
                },
                540: {
                    slidesPerView: 1,
                },
                640: {
                    slidesPerView: 1,
                },
                900: {
                    slidesPerView: 1,
                },
                1100: {
                    slidesPerView: 1,
                },
                1200: {
                    slidesPerView: 1,
                },
            },
        });
        var swiper = new Swiper(".shopcat", {
            autoplay: true,
            slidesPerView: 4,
            spaceBetween: 10,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            breakpoints: {
                0: {
                    slidesPerView: 1,
                    spaceBetween: 10,
                },
                750: {
                    slidesPerView: 2,
                    spaceBetween: 10,
                },
                900: {
                    slidesPerView: 3,
                    spaceBetween: 10,
                },

                1200: {
                    slidesPerView: 4,
                    spaceBetween: 10,
                },
            },
        });
        var swiper = new Swiper(".brandw", {
            autoplay: false,
            slidesPerView: 5,
            spaceBetween: 10,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            // autoplay: {
            //     delay: 2000, // 3 seconds delay between slides
            //     disableOnInteraction: false, // Keeps autoplay active even when user interacts
            // },
            breakpoints: {
                0: {
                    slidesPerView: 2,
                    spaceBetween: 10,
                },
                900: {
                    slidesPerView: 4,
                    spaceBetween: 10,
                },

                1200: {
                    slidesPerView: 5,
                    spaceBetween: 10,
                },
            },
        });
        var swiper = new Swiper(".HappyCustomer", {
            autoplay: false,
            slidesPerView: 2,
            spaceBetween: 20,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            // autoplay: {
            //     delay: 2000, // 3 seconds delay between slides
            //     disableOnInteraction: false, // Keeps autoplay active even when user interacts
            // },
            breakpoints: {
                0: {
                    slidesPerView: 1,
                    spaceBetween: 10,
                },
                900: {
                    slidesPerView: 2,
                    spaceBetween: 10,
                },

                1200: {
                    slidesPerView: 2,
                    spaceBetween: 10,
                },
            },
        });

        var swiper = new Swiper(".clientReview", {
            autoplay: true,
            slidesPerView: 2,
            spaceBetween: 10,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            },
            breakpoints: {
                0: {
                    slidesPerView: 1,
                },
                540: {
                    slidesPerView: 1,
                },
                640: {
                    slidesPerView: 1,
                },
                900: {
                    slidesPerView: 2,
                },
                1100: {
                    slidesPerView: 2,
                },
                1200: {
                    slidesPerView: 2,
                },
            },
        });
    </script>
@endpush
