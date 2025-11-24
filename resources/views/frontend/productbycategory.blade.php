{{-- @php
    dd($products);
@endphp --}}
@extends('frontend.components.layout')

@section('title')
    All Products
@endsection
@push('css')
    <style>
        .add-wishlist{
            padding: 0;
        }
        .add-wishlist:before{
            content: '';
            font-size: 1.2rem;
            display: block;
        }

        main{
            margin: 75px 0 25px !important;
        }

        .fashion_product_item .item_image {
            height: 410px;
        }

        @media only screen and (max-width: 1500px) {
            .fashion_product_item .item_image {
                height: 410px;
            }
        }

        @media only screen and (max-width: 1000px) {
            .fashion_product_item .item_image {
                height: 500px;
            }
        }

        @media only screen and (max-width: 600px) {
            .fashion_product_item .item_image {
                height: 300px;
            }
        }
    </style>
@endpush

@section('topmenu')
    @include('frontend.components.topmenu')
@endsection

@section('content')
    <main class="main">

        <div class="container">
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                </ol>
            </nav>

            <div class="row">
                <div class="col-lg-9 main-content">
                    <div class="showproduct">
                        <div class = "row row-cols-2 row-cols-md-2 row-cols-lg-3">
                            @forelse ($products as $product)
                                <div class="col">
                                    <div class="fashion_product_item">
                                        <div class="item_image">
                                            @php
                                                $thumbnail = json_decode($product->thumbnail, true);
                                            @endphp
                                                <img src="{{ $thumbnail ? singlePhoto($thumbnail) : asset('default-image.jpg') }}" alt="">
                                            <ul class="product_action_btns ul_li_center clearfix">
                                                <li>
                                                    <a class="addtocart_btn tooltips" data-placement="top"
                                                        title="Buy Now" href="{{ route('product', $product->id) }}">
                                                        <i class="fal fa-shopping-basket"></i> Buy
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="item_content">
                                            <h3 class="item_title"><a
                                                    href="{{ route('product', $product->id) }}">{{ $product->name }}</a></h3>
                                            <span class="item_price">
                                                @php
                                                    $sellingPrice = $product->selling_price;
                                                    $discountPrice = $product->discount_price;
                                                    $finalPrice = $sellingPrice - $discountPrice;
                                                    $formattedPrice = number_format($finalPrice, 2);
                                                @endphp
                                                @if ($product->discount_price > 0 && $product->selling_price > $product->discount_price)
                                                    <span style="padding-right: 10px">
                                                        <del class="price text-danger">&#2547;
                                                            {{ number_format($product->selling_price, 2) }}</del>
                                                    </span>
                                                    <span class="text-success">&#2547;
                                                        {{ $formattedPrice }}</span>
                                                        {{-- {{ number_format($product->selling_price - $product->discount_price, 2) }}</span> --}}
                                                @else
                                                    <span class="text-success">&#2547;
                                                        {{-- {{ $formattedPrice }}</span> --}}
                                                        {{ number_format($product->selling_price, 2) }}</span>
                                                @endif
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            @empty
                            @endforelse

                        </div>

                    </div>
                    <div class="mt-4 d-flex justify-content-center paginate">
                        {{ $products->links('vendor.pagination.bootstrap-5') }}
                    </div>
                </div>
                <div class="sidebar-overlay"></div>
                <aside class="sidebar-shop col-lg-3 order-lg-first mobile-sidebar">
                    <div class="sidebar-wrapper bg-catpro py-4 px-4">
                        <h4 class="pt-4">ALl Categories</h4>
                        <ul class="cat-list">
                            <nav class="side-nav">
                                {!! frontendCategories($menucategories) !!}
                            </nav>
                            {{-- @foreach ($menu as $item)
                                <li><a href="{{ route('product.bycategory', $item->id) }}">{{ $item->name }}</a></li>
                            @endforeach --}}
                        </ul>
                        <div class="mt-5">
                            <h4 class="pt-4">Filter by Price</h4>
                            <form method="GET" action="{{ url()->current() }}" class="mb-4">
                                <div class="row g-3 align-items-end">
                                    <div class="col-md-6">
                                        <label for="min_price" class="form-label">Min Price</label>
                                        <input type="number" name="min_price" id="min_price" class="form-control"
                                            value="{{ request('min_price') }}" step="0.01" min="0" placeholder="10">
                                    </div>

                                    <div class="col-md-6">
                                        <label for="max_price" class="form-label">Max Price</label>
                                        <input type="number" name="max_price" id="max_price" class="form-control"
                                            value="{{ request('max_price') }}" step="0.01" min="0" placeholder="100">
                                    </div>

                                    <div class="col-md-4 mt-3">
                                        <button type="submit" class="btn btn-primary w-100">Filter</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div><!-- End .sidebar-wrapper -->
                </aside>
            </div>
        </div>

        <div class="mb-3"></div>
    </main>
@endsection


@push('js')
        <script>
            var swiper = new Swiper(".mySwiper", {
                autoplay: true, // Disabling autoplay
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
                // autoplay: {
                //     delay: 3000, // 3 seconds delay between slides
                //     disableOnInteraction: false, // Keeps autoplay active even when user interacts
                // },
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


            var swiper = new Swiper(".mySwiperSecure", {
                autoplay: false, // Disabling autoplay
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
                // autoplay: {
                //     delay: 3000, // 3 seconds delay between slides
                //     disableOnInteraction: false, // Keeps autoplay active even when user interacts
                // },
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
        </script>
@endpush
