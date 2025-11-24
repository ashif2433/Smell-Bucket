@extends('frontend.components.layout')

@section('title')
    Product
@endsection
@push('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <style>
        .form-check-input:checked[type=radio] {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3e%3cpath fill='none' stroke='%23fff' stroke-linecap='round' stroke-linejoin='round' stroke-width='3' d='M6 10l3 3l6-6'/%3e%3c/svg%3e");
        }

        /* Remove the default arrows */
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Add custom up and down arrows */
        input[type="number"] {
            -moz-appearance: textfield;
            padding-right: 20px;
            /* Space for custom arrows */
            position: relative;
        }

        input[type="number"]::after {
            content: "↑↓";
            /* Custom arrows */
            position: absolute;
            right: 5px;
            top: 5px;
            font-size: 18px;
            /* Customize size of arrows */
            color: gray;
        }

        main{
            margin: 75px 0 25px !important;
        }

        .fashion_product_item .item_image {
            height: 350px;
        }

        .imgpro {
            height: 580px;
        }

        .line-clamp {
            display: -webkit-box;
            -webkit-line-clamp: 6;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        @media only screen and (max-width: 1500px) {
            .fashion_product_item .item_image {
                height: 410px;
            }
        }

        @media only screen and (max-width: 1000px) {
            .fashion_product_item .item_image {
                height: 380px;
            }

            .imgpro {
                height: 480px;
            }
        }

        @media only screen and (max-width: 600px) {
            .fashion_product_item .item_image {
                height: 320px;
            }

            .imgpro {
                height: 500px;
            }
        }
    </style>
@endpush

@section('topmenu')
    @include('frontend.components.topmenu')
@endsection

@section('content')

    <main class = "main">
        <div class = "container">
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <ol class = "breadcrumb">
                    <li class = "breadcrumb-item"><a href = "{{ route('index') }}"><i class = "icon-home"></i></a></li>
                    <li class = "breadcrumb-item"><a>Product</a></li>
                    <li class = "breadcrumb-item"><a>{{ $product->name }}</a></li>
                </ol>
            </nav>

            <div class = "product-single-container product-single-default">
                <div class = "row">
                    <div class = "col-md-5 product-single-gallery">
                        <div class = "product-slider-container">
                            <div class = "product-single-carousel owl-carousel owl-theme">
                                @foreach ($images as $item)
                                    <div class = "product-item" style = "border: 1px solid #ddd;">
                                        @php
                                            $photo = $item ? singlePhoto([$item]) : asset('default-image.jpg');
                                        @endphp
                                        <img class="product-single-image imgpro" src="{{ $photo }}"
                                            data-zoom-image="{{ $photo }}" />
                                        {{-- <img class = "product-single-image" src = "{{ singlePhoto([$item]) }}" data-zoom-image = "{{ singlePhoto([$item]) }}" /> --}}
                                    </div>
                                @endforeach

                            </div>
                            <!-- End .product-single-carousel -->
                            <span class = "prod-full-screen">
                                <i class = "icon-plus"></i>
                            </span>
                        </div>
                        <div class = "prod-thumbnail owl-dots" id = 'carousel-custom-dots' style="overflow-x: auto;">
                            @foreach ($images as $item)
                                <div class = "owl-dot">
                                    @php
                                        $photo = $item ? singlePhoto([$item]) : asset('default-image.jpg');
                                    @endphp
                                    <img class="product-single-image" src="{{ $photo }}"style="max-width: 120px" />
                                    {{-- <img src = "{{ singlePhoto([$item]) }}" style = "max-width: 120px" /> --}}
                                </div>
                            @endforeach
                        </div>
                    </div><!-- End .product-single-gallery -->

                    <div class = "col-md-7 product-single-details pt-3 pt-md-0">
                        <h4 class = "product-title" style = "font-weight: 500; font-size: 22px;">{{ $product->name }}</h4>

                        <div class = "ratings-container">
                            @for ($i = 0; $i < $product->rating; $i++)
                                <span class="fas fa-star" style="color: rgb(23, 92, 20);"></span>
                            @endfor
                            @for ($i = $product->rating; $i < 5; $i++)
                                <span class="fas fa-star" style="color: rgb(56, 54, 49);"></span>
                            @endfor

                        </div>

                        <hr class = "short-divider">

                        <div class = "price-box">

                            @if ($product->main_price < $product->selling_price)
                                <del style = "font-size: 22px" class = "old-price">&#2547;
                                    {{ $product->selling_price }}</del>
                            @endif
                            <span style = "font-size: 22px" class = "">&#2547;
                                {{ number_format($product->main_price) }}</span>

                        </div>

                        <div class="product-desc line-clamp">
                            <p class="small lh-sm">{!! $product->description !!}</p>
                        </div>

                        @if ($product->sku_code)
                            <div class="product-sku">
                                <p class="small lh-sm">SKU: {{ $product->sku_code }}</p>
                            </div>
                        @endif
                        @if (count(json_decode($product->size)))
                            <div class = "product-filters-container">
                                <div class = "product-single-filter mb-2 d-flex">
                                    <label>Sizes : <strong id="size-name" style="display: none"></strong></label>
                                    <ul class="config-size-list">
                                        @foreach (json_decode($product->size) as $key => $value)
                                            <div class="form-check form-check-inline">
                                                <input style="height: 14px;width: 14px;border-radius:50%"
                                                    class="form-check-input me-1" type="radio" id="{{ $value }}"
                                                    name="size" value="{{ $value }}">
                                                <label class="form-check-label"
                                                    for="{{ $value }}">{{ $value }}</label>
                                            </div>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        @endif
                        @if (count(json_decode($product->color)) > 0)
                            <div class = "product-filters-container">
                                <div class = "product-single-filter mb-2 d-flex">
                                    <label>Color : </label>
                                    <ul class="config-size-list">
                                        {{-- @foreach (json_decode($product->color) as $key => $value)
                                            <div class="form-check form-check-inline" style="position: relative">
                                                <input
                                                    style="height: 24px;width: 24px;border-radius: 50%;position: absolute;"
                                                    class="form-check-input color me-1" type="radio"
                                                    id="{{ $value }}" name="color" value="{{ $value }}">
                                                <label class="form-check-label" for="{{ $value }}">
                                                    <div
                                                        style="height: 25px;width: 25px;background-color:{{ colorCode($value) }}">
                                                    </div>
                                                </label>
                                            </div>
                                        @endforeach --}}
                                        @foreach (json_decode($product->color) as $key => $value)
    @php
        // Check if value starts with '#' (means it's already a color code)
        $bgColor = str_starts_with($value, '#') ? $value : colorCode($value);
    @endphp
    <div class="form-check form-check-inline" style="position: relative">
        <input
            style="height: 24px;width: 24px;border-radius: 50%;position: absolute;"
            class="form-check-input color me-1" type="radio"
            id="{{ $value }}" name="color" value="{{ $value }}">
        <label class="form-check-label" for="{{ $value }}">
            <div style="height: 25px;width: 25px;background-color:{{ $bgColor }}">
            </div>
        </label>
    </div>
@endforeach


                                    </ul>
                                </div><!-- End .product-single-filter -->
                            </div><!-- End .product-filters-container -->
                        @endif
                        <div>
                            <small class="fw-normal">AVAILABLE : </small>
                            @if ($product->remaining_stock > 0)
                                <span class="text-success">inStock {{ $product->remaining_stock }}</span>
                            @else
                                <span class="text-danger">Stock out 0</span>
                            @endif
                        </div>

                        <hr class = "divider">
                        @if ($product->remaining_stock > 0)
                            <div class = "product-action d-flex" style = "height: 47px;">
                                <div class = "d-flex me-3">
                                    <button id = "qtyminus"
                                        style = "background: transparent;border: 1px solid #eee;cursor: pointer;"
                                        type = "submit">
                                        <i style = "padding: 10px 5px" class = "fa fa-minus" aria-hidden = "true"></i>
                                    </button>

                                    <input style = "font-size: 18px;text-align: center; height: 47px; width:100px"
                                        id = "quantity" class = "form-control" name = "quantity" type = "text"
                                        value = "1" max = "{{ $product->remaining_stock }}" min = "1">

                                    <button id = "qtyplus"
                                        style = "background: transparent;border: 1px solid #eee;cursor: pointer;"
                                        type = "submit">
                                        <i style = "padding: 10px 5px" class = "fa fa-plus" aria-hidden = "true"></i>
                                    </button>

                                </div><!-- End .product-single-qty -->
                                <input type = "hidden" id = "id" name = "id" value = "{{ $product->id }}">

                                <a href="javascript:" id="add-to-cart" class="btn btn-dark add-cart icon-shopping-cart mx-2"
                                    title="Add to Cart">Add to Cart</a>
                            </div><!-- End .product-action -->
                            <div>
                                <a href="javascript:" id="order-now" class="btn btn-danger order-now" title="Order Now"
                                    style="width: 292px;padding: 14px;margin-top: 15px;">Order Now</a>
                            </div>
                        @endif

                        {{-- <hr class = "divider mb-1"> --}}
                        <a href = "" class = "add-wishlist d-none" title = "Add to Wishlist"
                            data-id = "{{ $product->id }}">Add to
                            Wishlist</a>
                    </div><!-- End .product-single-details -->
                </div><!-- End .row -->
            </div><!-- End .product-single-container -->

            @if(!empty($product->videoid && $product->description))
            <div class="row py-5">
                <div class="col-md-12 py-3">
                    <h3>Description</h3>
                </div>
                <div class="col-md-8">
                    <div class = "product-desc-content">
                        {!! $product->description !!}
                    </div>
                </div>
                <div class="col-md-4">
                    <iframe style="min-height: 350px; width:100%" src="https://www.youtube.com/embed/{{ $product->videoid }}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>
            @else
            <div class="row py-5">
                <div class="col-md-12 py-3">
                    <h3>Description</h3>
                </div>
                <div class="col-md-12">
                    <div class = "product-desc-content">
                        {!! $product->description !!}
                    </div>
                </div>
            </div>

            @endif


            <section class="py-3">
                <div class="auto-container">
                    <div class="container my-5">
                        <h4 class="fw-bold m-0">Related Products</h4>
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">
                                @foreach ($relproducts as $rproduct)
                                    <div class="swiper-slide">

                                        <div class="fashion_product_item">
                                            <div class="item_image">
                                                @php
                                                        $thumbnail = json_decode($rproduct->thumbnail, true);
                                                    @endphp
                                                    <img src="{{ $thumbnail ? singlePhoto($thumbnail) : asset('default-image.jpg') }}"
                                                        alt="no img">
                                                <ul class="product_action_btns ul_li_center clearfix">
                                                    <li>
                                                        <a class="addtocart_btn tooltips" data-placement="top"
                                                            title="Buy Now" href="{{ route('product', $rproduct->id) }}">
                                                            <i class="fal fa-shopping-basket"></i> Buy
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="item_content">
                                                {{-- <span class="item_category text-uppercase">category</span> --}}
                                                <h3 class="item_title"><a
                                                        href="{{ route('product', $rproduct->id) }}">{{ $rproduct->name }}</a></h3>
                                                <span class="item_price">
                                                    @if ($rproduct->discount_price > 0 && $rproduct->selling_price > $rproduct->discount_price)
                                                        <span style="padding-right: 10px">
                                                            <del class="price text-danger">&#2547;
                                                                {{ number_format($rproduct->selling_price, 2) }}</del>
                                                        </span>
                                                        <span class="text-success">&#2547;
                                                            {{ number_format($rproduct->selling_price - $rproduct->discount_price, 2) }}</span>
                                                    @else
                                                        <span class="text-success">&#2547;
                                                            {{ number_format($rproduct->selling_price, 2) }}</span>
                                                    @endif
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                            <!-- Add Pagination -->
                            {{-- <div class="swiper-pagination"></div> --}}
                            <!-- Add Navigation -->
                            {{-- <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div> --}}
                        </div>
                    </div>
                </div>
            </section>
        </div><!-- End .container -->
    </main><!-- End .main -->
@endsection
@push('js')
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <script>
        var swiper = new Swiper(".mySwiper", {
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
            autoplay: {
                delay: 3000, // 3 seconds delay between slides
                disableOnInteraction: false, // Keeps autoplay active even when user interacts
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
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let quantityInput = document.getElementById("quantity");
            let qtyPlus = document.getElementById("qtyplus");
            let qtyMinus = document.getElementById("qtyminus");

            let maxStock = parseInt(quantityInput.getAttribute("max")); // Get max stock from the input

            qtyPlus.addEventListener("click", function(e) {
                e.preventDefault();
                let currentValue = parseInt(quantityInput.value);

                // Check if current value is less than max stock
                if (currentValue < maxStock) {
                    quantityInput.value = currentValue + 1; // Increase by 1
                }
            });

            qtyMinus.addEventListener("click", function(e) {
                e.preventDefault();
                let currentValue = parseInt(quantityInput.value);

                // Check if current value is greater than 1
                if (currentValue > 1) {
                    quantityInput.value = currentValue - 1; // Decrease by 1
                }
            });

            quantityInput.addEventListener("input", function() {
                let currentValue = parseInt(quantityInput.value);

                // If the value exceeds max stock, set it to max stock
                if (currentValue > maxStock) {
                    quantityInput.value = maxStock;
                }

                // If the value is less than 1 or NaN, reset it to 1
                if (currentValue < 1 || isNaN(currentValue)) {
                    quantityInput.value = 1;
                }
            });
        });
    </script>
@endpush
