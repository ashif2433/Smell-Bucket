{{-- @php
    dd($products);
@endphp --}}
@extends('frontend.components.layout')

@section('title')
    Search
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

        .sidebar-toggle {
            display: none;
        }

        main{
            margin: 150px 0 75px !important;
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
@section('content')
    <div class="container mb-2">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href=""><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item"><a href="#">Search Result</a></li>
            </ol>
        </nav>
        <div class="row">
            <div class="col-lg-12">
                {{-- <div class="row"> --}}
                    @if ($products->count() == 0)
                        <div class="col-12 text-center my-5">
                            <h4 class="py-5">No Product Found!</h4>
                        </div>
                    @endif

                    <div class = "row row-cols-2 row-cols-md-3 row-cols-lg-4 pb-5 pb-sm-0">
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




                {{-- </div> --}}
                <div class="row justify-content-end">
                    {{ $products->links() }}
                </div>
            </div><!-- End .col-lg-9 -->

            <div class="sidebar-overlay"></div>
            <div class="sidebar-toggle"><i class="fas fa-sliders-h"></i></div>
            {{-- <aside class="sidebar-shop col-lg-3 order-lg-first mobile-sidebar">
                <div class="sidebar-wrapper bg-catpro py-4 px-4">
                    <h4 class="pt-4">Popular Category</h4>
                    <ul class="cat-list">

                        @foreach ($menu as $item)
                            <li><a href="{{ route('product.bycategory', $item->id) }}">{{ $item->name }}</a></li>
                        @endforeach
                    </ul>
                </div>
            </aside> --}}
        </div>
    </div>


@endsection
