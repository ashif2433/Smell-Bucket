{{-- @php
    dd($websiteInfo->logo);
@endphp --}}
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Invoice {{ $order->order_no }}</title>
    <style>
        h4 {
            margin: 0;
        }

        .w-full {
            width: 100%;
        }

        .w-half {
            width: 50%;
        }

        .margin-top {
            margin-top: 1.25rem;
        }

        .footer {
            font-size: 0.875rem;
            padding: 1rem;
            background-color: rgb(241 245 249);
        }

        table {
            width: 100%;
            border-spacing: 0;
        }

        table.products {
            font-size: 0.875rem;
        }

        table.products tr {
            /* background-color: rgb(96 165 250); */
        }

        table.products th {
            color: #000000;
            padding: 0.5rem;
            text-align: left;
        }

        table tr.items {
            background-color: rgb(241 245 249);
        }

        table tr.items td {
            padding: 0.5rem;
        }

        .total {
            text-align: right;
            margin-top: 1rem;
            font-size: 0.875rem;
        }
    </style>
</head>

<body>
    <table class="w-full">
        <tr>
            <td class="w-half">
                <img src="{{ public_path($websiteInfo->logo) }}" alt="{{ $websiteInfo->company_name }}" width="200" />
            </td>
            <td class="w-half">
                <h2>Invoice ID: {{ $order->order_no }}</h2>
            </td>
        </tr>
    </table>

    <div class="margin-top">
        <table class="w-full">
            <tr>
                <td class="w-half">
                    <h4>To: <b>{{ $order->customer_name }}</b></h4>
                    {{-- <div></div> --}}
                    <div>{{ $order->customer_phone }}</div>
                    <div>{{ $order->shipping_address }}</div>
                </td>
                <td class="w-half">
                    <h4>From:</h4>
                    <div>{{ $websiteInfo->company_name }}</div>
                    <div>{{ $websiteInfo->address }}</div>
                </td>
            </tr>
        </table>
    </div>

    <div class="margin-top">
        <table class="products">
            <tr>
                <th style="width: 15%">Order No</th>
                <th style="width: 10%">Images</th>
                <th style="width: 60%">Details</th>
                <th style="width: 15%">Status</th>
            </tr>



            <tr>
                <td style="padding-left: 8px; width: 20%">{{ $order->order_no }}</td>
                {{-- <td style="padding-left: 10px; width: 20%">
                    @foreach ($order->OrderDetails as $detail)
                        <p>
                            <img src="{{ public_path(is_array(json_decode($detail->products->thumbnail)) ? singlePhoto(json_decode($detail->products->thumbnail)) : '') }}"
                            width="40" height="35">
                        </p>
                    @endforeach
                </td>


                <td style="padding-left: 8px; width: 50%">
                    @foreach ($order->OrderDetails->groupBy('product_name') as $productName => $details)
                        <p>{{ $details->sum('quantity') }} <small>x</small> {{ $productName }}

                            @if ($detail->size)
                                (S: {{ $detail->size }})
                            @endif

                            @if ($detail->color !== null)
                                (C: {{ $colorMap[$detail->color] ?? 'Unknown' }})
                                <span
                                    style="height: 15px; width: 15px; background-color: {{ $colorMap[$detail->color] ?? 'null' }};">
                                </span>
                            @endif
                        </p>
                    @endforeach
                </td> --}}

                <td style="padding-left: 10px; width: 20%">
    @foreach ($order->OrderDetails as $detail)
        <p>
            <img src="{{ public_path(is_array(json_decode($detail->products->thumbnail)) ? singlePhoto(json_decode($detail->products->thumbnail)) : '') }}"
            width="40" height="35">
        </p>
    @endforeach
</td>

<td style="padding-left: 8px; width: 50%">
    @foreach ($order->OrderDetails->groupBy('product_name') as $productName => $details)
        @php
            $firstDetail = $details->first();
        @endphp
        <p style="margin-bottom: 2px">
            {{ $details->sum('quantity') }} <small>x</small> {{ $productName }}

            @if ($firstDetail->size)
                (S: {{ $firstDetail->size }})
            @endif

            @if ($firstDetail->color !== null)
                (C: {{ $colorMap[$firstDetail->color] ?? 'Unknown' }})
                <span style="display: inline-block; height: 15px; width: 15px; background-color: {{ $colorMap[$firstDetail->color] ?? 'null' }};">
                </span>
            @endif
        </p>
    @endforeach
</td>

                <td style="padding-left: 8px; width: 10%">{{ $order->delivery_status }}</td>
            </tr>
        </table>
    </div>

    <div class="total">
        Total: {{ $order->total }}tk
    </div>

    <div class="footer margin-top">
        {{-- <div>Thank you</div>
        <div>&copy; {{ $websiteInfo->company_name }}</div> --}}
        <p style="text-align: center"><strong>Quality, Reliability & Originality.</strong></p>
    </div>
</body>

</html>
