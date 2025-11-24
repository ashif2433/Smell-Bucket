{{-- {{ dd($customer) }} --}}
@extends('frontend.components.layout')

@section('title')
    Checkout
@endsection
@push('css')
<link rel="stylesheet" type="text/css" href="{{ asset('frontend/assets/css/custom.css') }}">
<link rel="stylesheet" type="text/css"
    href="{{ asset('frontend/assets/vendor/simple-line-icons/css/simple-line-icons.min.css') }}">
    <style>
        textarea.form-control {
            max-width: 100%;
            min-height: 112px;
        }

        input[type=text],
        textarea.form-control {
            font-size: 14px;
        }

        main{
            margin: 75px 0 25px !important;
        }

        @media only screen and (max-width: 1500px) {
            /* h3 {
                font-size: 20px;
            } */
        }

        @media only screen and (max-width: 1000px) {

        }

        @media only screen and (max-width: 600px) {
            h3 {
                font-size: 20px;
            }
            h6 {
                font-size: 15px;
            }
        }
    </style>
@endpush


@section('topmenu')
    @include('frontend.components.topmenu')
@endsection

@section('content')
    <main class="main">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                </ol>
            </div>
        </nav>

        <div class="container mt-5">

            <form action="{{ url('/pay') }}" method="POST" class="needs-validation">
                <input type="hidden" value="{{ csrf_token() }}" name="_token" />

                <div class="row">
                    <div class="col-lg-6">
                        {{-- <h2 class="step-title">Shipping Address</h2> --}}
                        <h3 class="step-title">শিপিং ঠিকানা</h3>
                        <hr>
                        {{-- <ul class="checkout-steps">
                            <li>
                                <h2 class="step-title">শিপিং ঠিকানা</h2>
                            </li>
                        </ul> --}}

                        <div class="row justify-content-center text-center">
                            @if (session('message'))
                                <div class="col-md-12 alert alert-danger }}">{{ session('message') }}</div>
                            @endif
                        </div>

                        <div class="row mb-5">

                            @if ($customer)
                                <div class="col-md-12">
                                    <input type="hidden" name="customer_id" value="{{ $customer->id }}">
                                    <div class="form-group">
                                        {{-- <label for="name">Full Name *</label> --}}
                                        <label for="name">আপনার নাম লিখুন *</label>
                                        <input type="text" readonly
                                            class="form-control @error('name') is-invalid @enderror" name="name"
                                            id="name" placeholder="নাম" value="{{ $customer->name }}" required
                                            style="height: 44px">
                                        @error('name')
                                            <div class="text-danger" style="font-size: 12px">
                                                {{ $message }} </div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group mb-3">
                                        {{-- <label for="phone">Phone Number *</label> --}}
                                        <label for="phone">আপনার নম্বর লিখুন *</label>
                                        <input type="number" readonly
                                            class="form-control @error('phone') is-invalid @enderror" name="phone"
                                            id="phone" placeholder="নম্বর" value="{{ $customer->phone }}"
                                            required style="height: 44px">
                                        @error('phone')
                                            <div class="text-danger" style="font-size: 12px">
                                                {{ $message }} </div>
                                        @enderror
                                    </div>
                                </div>
                            @else
                                <div class="col-md-12">
                                    <div class="form-group">
                                        {{-- <label for="name">Full Name *</label> --}}
                                        <label for="name">আপনার নাম লিখুন *</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror"
                                            name="name" id="name" placeholder="নাম"
                                            value="{{ old('name') }}" required style="height: 44px">
                                        @error('name')
                                            <div class="text-danger" style="font-size: 12px">
                                                {{ $message }} </div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group mb-3">
                                        {{-- <label for="phone">Phone Number *</label> --}}
                                        <label for="phone">আপনার নম্বর লিখুন *</label>
                                        <input type="number" class="form-control @error('phone') is-invalid @enderror"
                                            name="phone" id="phone" placeholder="নম্বর"
                                            value="{{ old('phone') }}" required style="height: 44px">
                                        @error('phone')
                                            <div class="text-danger" style="font-size: 12px">
                                                {{ $message }} </div>
                                        @enderror
                                    </div>
                                </div>
                            @endif
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="d-flex justify-content-between align-items-center">
                                        {{-- <label for="address">Address * (You can add another number here) </label> --}}
                                        <label for="address">ঠিকানা * (আপনি এখানে আরেকটি নম্বরও যোগ করতে পারেন) </label>
                                        @if ($customer)
                                            <select class="form-select" id="addressSelect" aria-label="Default select example" style="width: 140px">
                                                <option selected disabled>Select Address</option>
                                                <option value="office">Office Address</option>
                                                <option value="home">Home Address</option>
                                            </select>
                                        @endif
                                    </div>
                                    <textarea class="form-control @error('address') is-invalid @enderror" id="addressTextarea" name="address" cols="30" rows="3"
                                        placeholder="ঠিকানা" required>{{ old('address') }}</textarea>
                                    @error('address')
                                        <div class="text-danger" style="font-size: 12px">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <label for="note">নোট</label>
                                    </div>
                                    <textarea class="form-control @error('note') is-invalid @enderror" id="note" name="note" cols="30" rows="2"
                                        placeholder="নোট">{{ old('note') }}</textarea>
                                    @error('note')
                                        <div class="text-danger" style="font-size: 12px">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                            </div>

                        </div>
                    </div><!-- End .col-lg-8 -->

                    <div class="col-lg-6">
                        <div class="order-summary">
                            {{-- <h3>Summary</h3> --}}
                            <h3>সারাংশ</h3>
                            <hr>
                            <h4>
                                <a data-toggle="collapse" href="#order-cart-section" class="collapsed" role="button"
                                    aria-expanded="false"
                                    aria-controls="order-cart-section">কার্টে {{ \Cart::content()->count() }}
                                    প্রোডাক্ট আছে</a>
                            </h4>
                            <div class="collapse show" id="order-cart-section"
                                style="max-height: 500px; overflow: scroll">
                                <table class="table table-mini-cart">
                                    <tbody>
                                        @foreach (\Cart::content() as $item)
                                            <tr>
                                                <td class="product-col" style="width: 75px;">
                                                    <figure class="product-image-container">
                                                        {{-- <a href="{{ route('product', $item->options->slug) }}" --}}
                                                        <a onclick="return false;" class=""
                                                            class="product-image">
                                                            <img src="{{ singlePhoto(json_decode($item->options->thumbnail)) }}"
                                                                alt="product">
                                                        </a>
                                                    </figure>
                                                </td>
                                                <td style="padding-left: 10px ">
                                                    <p class="product-title cartItem m-0"
                                                        style="font-size: 12px; text-align:start">
                                                        <a onclick="return false;">{{ $item->name }}</a>
                                                        {{-- <a href="{{ route('product', $item->options->slug) }}">{{ $item->name }}</a> --}}
                                                    </p>
                                                    <span class="product-qty" style="font-size: 12px;">Price:
                                                        {{ $item->price }}</span>
                                                    <span class="product-qty" style="font-size: 12px;">Size:
                                                        {{ $item->options->size }}</span>
                                                    {{-- <span class="product-qty d-flex" style="font-size: 12px;">Color: <div
                                                            class="ms-2"
                                                            style="height: 15px;width: 15px;background-color:{{ $item->options->color == '' ? '' : colorCode($item->options->color) }}">
                                                        </div>
                                                    </span> --}}
                                                    <span class="product-qty d-flex align-items-center" style="font-size: 12px;">
    Color:
    <span class="ms-2"
          style="display: inline-block; height: 15px; width: 15px; background-color: {{ $item->options->color == '' ? 'transparent' : colorCode($item->options->color) }}; border: 1px solid #ccc; border-radius: 3px;">
    </span>
</span>

                                                </td>
                                                <td>
                                                    <div class = "d-flex me-3">

                                                        <div class = "d-flex me-3">
                                                            {{-- <button id = "qtyminus" style = "background: transparent;border: 1px solid #eee;cursor: pointer;" type = "submit">
                                                                <i style = "padding: 10px 5px" class = "fa fa-minus" aria-hidden = "true"></i>
                                                            </button> --}}

                                                            <input type="number"
                                                            style="font-size:14px;text-align:center;height:35px;width:70px;margin-bottom: 0px;padding:0px"
                                                            id="quantity"
                                                            oninput="updateCart(this.value, '{{ $item->rowId }}')"
                                                            class="form-control" name="quantity"
                                                            value="{{ $item->qty }}" min="1">

                                                            {{-- <input style = "font-size: 18px;text-align: center; height: 47px; width:100px" id = "quantity" class = "form-control" name = "quantity" type = "text" value = "1" max = "{{ $product->remaining_stock }}" min = "1"> --}}

                                                            {{-- <button id = "qtyplus" style = "background: transparent;border: 1px solid #eee;cursor: pointer;" type = "submit">
                                                                <i style = "padding: 10px 5px" class = "fa fa-plus" aria-hidden = "true"></i>
                                                            </button> --}}

                                                        </div>

                                                        {{-- <input type="number"
                                                            style="font-size:14px;text-align:center;height:35px;width:70px;margin-bottom: 0px;padding:0px"
                                                            id="quantity"
                                                            oninput="updateCart(this.value, '{{ $item->rowId }}')"
                                                            class="form-control" name="quantity"
                                                            value="{{ $item->qty }}" min="1"> --}}


                                                    </div><!-- End .product-single-qty -->
                                                </td>
                                                <td class="price-col" style="font-size: 12px;">&#2547; <span
                                                        id="{{ $item->rowId }}">{{ $item->price * $item->qty }}</span>
                                                </td>
                                                <td>
                                                    <a href="{{ route('cart.remove', $item->rowId) }}" style="font-size: 12px;padding:5px;color:red;font-weight:bold"><i class="fas fa-trash-alt"></i></a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div><!-- End #order-cart-section -->
                            <h4 class="font-weight-normal" style="font-size: 13px">
                                <div class="d-flex justify-content-between py-3">
                                    {{-- <span>Sub Total</span> --}}
                                    <span>মোট</span>
                                    <span id="subtotal"> &#2547;{{ Cart::subtotal() }}</span>
                                </div>
                                <div class="d-flex justify-content-between py-3">
                                    <span>ডেলিভারি চার্জ</span>
                                    <span id="dCharge">&#2547; {{ $setting->d_charge_inside_dhaka }}</span>
                                </div>
                                <div class="row mx-4">
                                    <div class="col-md-12 py-1 align-items-center form-check">
                                        <input class="form-check-input" style="margin-top: 0.1rem;" type="radio" name="delivery_charge" value="inside" id="inside" checked onchange="updateDeliveryCharge();">
                                        <label class="form-check-label" for="inside" style="font-weight: normal;margin-right:15px">ঢাকা সিটির ভেতরে</label>
                                    </div>
                                    <div class="col-md-12 py-1 mt-2 mt-sm-0 form-check">
                                        <input class="form-check-input" style="margin-top: 0.1rem;" type="radio" name="delivery_charge" value="urban" id="urban" onchange="updateDeliveryCharge();">
                                        <label class="form-check-label" for="urban" style="font-weight: normal">ঢাকা সিটির বাইরে</label>
                                    </div>
                                    <div class="col-md-12 py-1 mt-2 mt-sm-0 form-check">
                                        <input class="form-check-input" style="margin-top: 0.1rem;" type="radio" name="delivery_charge" value="outside" id="outside" onchange="updateDeliveryCharge();">
                                        <label class="form-check-label" for="outside" style="font-weight: normal">ঢাকার বাইরে</label>
                                    </div>
                                </div>
                            </h4>
                            <h4>
                                <div class="d-flex justify-content-between pt-3 h4">
                                    {{-- <span>Order Total</span> --}}
                                    <span>অর্ডারের মোট</span>
                                    <span id="subtotalsum">
                                        &#2547; {{ number_format((float) str_replace(',', '', Cart::subtotal()) + (float) $setting->d_charge_inside_dhaka, 2) }}
                                    </span>
                                </div>
                            </h4>

                            <hr>
                            <div class="col-md-12 mt-3" style="padding-left: 0px">
                                {{-- <h2 class="step-title">Payment Methods</h2> --}}
                                <h3>পেমেন্ট পদ্ধতি</h3>
                            </div>
                            <div class="col-md-12 mt-3 d-flex">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="payment_type" value="cash"
                                        id="cashOnDelivery" checked>
                                    <label class="form-check-label" for="cashOnDelivery">
                                        {{-- <h6>Cash On Delivery</h6> --}}
                                        <h6>ক্যাশ অন ডেলিভারি</h6>
                                    </label>
                                </div>
                                <div class="form-check" style="margin-left: 10px">
                                    <input class="form-check-input" type="radio" name="payment_type" value="online"
                                        id="payOnline">
                                    <label class="form-check-label" for="payOnline">
                                        {{-- <h6>Pay Online</h6> --}}
                                        <h6>অনলাইনে পেমেন্ট</h6>
                                    </label>
                                </div>

                            </div>


                            <div class="row mt-4">
                                <div class="col-6">
                                    {{-- <p class="small">অর্ডারটি কনফার্ম করতে ফর্মটি সম্পুর্ণ পুরণ করে নিচের Place Order বাটনে ক্লিক
                                    করুন।</p> --}}
                                </div>
                                <div class="col-6 d-flex justify-content-end align-items-end">
                                    {{-- <button type="submit" class="btn btn-primary">Place Order</button> --}}
                                    <button type="submit" class="btn btn-primary">অর্ডার করুন</button>
                                </div>
                            </div>
                        </div><!-- End .order-summary -->
                    </div><!-- End .col-lg-4 -->

                    {{-- <div class="col-lg-6 offset-lg-3 mt-4 text-center">
                        <p class="small">অর্ডারটি কনফার্ম করতে ফর্মটি সম্পুর্ণ পুরণ করে নিচের Place Order বাটনে ক্লিক
                            করুন।</p>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Place Order</button>
                        </div>
                    </div> --}}
                </div><!-- End .row -->
            </form>


        </div><!-- End .container -->

        <div class="mb-6"></div><!-- margin -->
    </main><!-- End .main -->
@endsection

@push('js')

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const banglaBlockInputs = ['name', 'phone', 'addressTextarea', 'note'];

        banglaBlockInputs.forEach(id => {
            const input = document.getElementById(id);
            if (input) {
                input.addEventListener('input', function () {
                    // Remove Bangla characters using Unicode range
                    this.value = this.value.replace(/[\u0980-\u09FF]/g, '');
                });
            }
        });
    });
</script>

<script src="{{ asset('frontend/custom.js') }}"></script>


    <script>
        // function updateDeliveryCharge() {
        //     let subtotal = parseFloat("{{ str_replace(',', '', Cart::subtotal()) }}"); // Get subtotal
        //     let deliveryCharge = document.querySelector('input[name="delivery_charge"]:checked').value;
        //     let totalAmount = 0;

        //     //new
        //     const insideCharge = {{ $setting->d_charge_inside_dhaka }};
        //     const outsideCharge = {{ $setting->d_charge_outside_dhaka }};
        //     const displayCharge = document.getElementById('dCharge');
        //     //new
        //     // Calculate total based on selected delivery charge
        //     if (deliveryCharge === "inside") {
        //         displayCharge.textContent = parseFloat(insideCharge).toFixed(2);
        //         totalAmount = subtotal + insideCharge; // Inside Dhaka delivery charge
        //         // totalAmount = subtotal + 100.0; // Inside Dhaka delivery charge
        //     } else if (deliveryCharge === "outside") {
        //         displayCharge.textContent = parseFloat(outsideCharge).toFixed(2);
        //         totalAmount = subtotal + outsideCharge; // Outside Dhaka delivery charge
        //     }

        //     // Update the total on the page
        //     document.getElementById('subtotalsum').innerHTML = '&#2547; ' + totalAmount.toFixed(2);
        // }

        function updateDeliveryCharge() {
    let subtotal = parseFloat("{{ str_replace(',', '', Cart::subtotal()) }}");
    let deliveryCharge = document.querySelector('input[name="delivery_charge"]:checked').value;
    let totalAmount = 0;

    const insideCharge = {{ $setting->d_charge_inside_dhaka }};
    const outsideCharge = {{ $setting->d_charge_outside_dhaka }};
    const urbanCharge = {{ $setting->urban }}; // Fallback if not defined
    const displayCharge = document.getElementById('dCharge');

    if (deliveryCharge === "inside") {
        displayCharge.textContent = parseFloat(insideCharge).toFixed(2);
        totalAmount = subtotal + insideCharge;
    } else if (deliveryCharge === "outside") {
        displayCharge.textContent = parseFloat(outsideCharge).toFixed(2);
        totalAmount = subtotal + outsideCharge;
    } else if (deliveryCharge === "urban") {
        displayCharge.textContent = parseFloat(urbanCharge).toFixed(2);
        totalAmount = subtotal + urbanCharge;
    }

    document.getElementById('subtotalsum').innerHTML = '&#2547; ' + totalAmount.toFixed(2);
}

</script>
    <script>
        function updateCart(qty, rowId) {
            $.ajax({
                url: '{{ route('cart.update') }}', // Define this route in your routes file
                type: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    qty: qty,
                    rowId: rowId
                },
                success: function(response) {
                    if (response.status == true) {
                        $("#" + rowId).html(response.total)

                        $("#subtotal").html('&#2547; ' + response.subtotal)
                        $("#subtotalsum").html('&#2547; ' + response.subtotalsum)
                        // $("#subtotal").html( + response.subtotal)
                        // $("#subtotalsum").html( + response.subtotalsum)

                        // alert('Cart updated successfully!');
                        location.reload(); // Reload the page to reflect changes
                    }
                },
                error: function() {
                    alert('Something went wrong, please try again.');
                }
            });
        }
    </script>

<script>
    document.getElementById('addressSelect').addEventListener('change', function () {
        let addressField = document.getElementById('addressTextarea');
        let officeAddress = @json($customer->address2 ?? '');
        let homeAddress = @json($customer->address3 ?? '');

        if (this.value === 'office') {
            addressField.value = officeAddress;
        } else if (this.value === 'home') {
            addressField.value = homeAddress;
        } else {
            addressField.value = ""; // Reset if "Select Address" is chosen
        }
    });
</script>
@endpush
