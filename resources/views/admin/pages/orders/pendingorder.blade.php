@extends('admin.layouts.app')
@section('title')
    Pending
@endsection
@push('css')
    <style>
        .form-check-input {
            height: 1.3em;
        }
    </style>
@endpush

@section('content')
    @php
        // Color name map
        $colorMap = [
            1 => 'Green',
            2 => 'Blue',
            3 => 'Black',
            4 => 'DarkSalmon',
            5 => 'LightSalmon',
            6 => 'Crimson',
            7 => 'Red',
            8 => 'FireBrick',
            9 => 'DarkRed',
            10 => 'Pink',
            11 => 'Navy Blue',
            12 => 'Merun',
        ];

        // Hex color map
        $hexColorMap = [
            1 => '#008000',
            2 => '#0000FF',
            3 => '#000000',
            4 => '#E9967A',
            5 => '#FFA07A',
            6 => '#DC143C',
            7 => '#FF0000',
            8 => '#B22222',
            9 => '#8B0000',
            10 => '#FFC0CB',
            11 => '#000080',
            12 => '#800000',
        ];
    @endphp

    <div class="d-flex justify-content-between">
        <div>
            <h6 class="mb-0 text-uppercase">Pending Orders</h6>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example2" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="selectAll"></th>
                                    <th>Order No</th>
                                    <th>Product img</th>
                                    <th>Product details</th>
                                    <th>Customer</th>
                                    <th>Product notes</th>
                                    <th>Amount</th>
                                    <th>Delivery Status</th>
                                    <th>Payment Method</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($orders as $product)
                                    <tr>
                                        <td><input type="checkbox" class="select-row" value="{{ $product->id }}"></td>
                                        <td>{{ $product->order_no }}</td>
                                        <td>
                                            @foreach ($product->OrderDetails as $detail)
                                                @php
                                                    $thumbnail = json_decode($detail->products?->thumbnail);
                                                @endphp
                                                <img src="{{ is_array($thumbnail) ? singlePhoto($thumbnail) : '' }}"
                                                    width="50">
                                            @endforeach
                                        </td>

                                        <td>
                                            @foreach ($product->OrderDetails->groupBy('product_name') as $productName => $details)
                                                <div>
                                                    {{ $details->sum('quantity') }} <small>x</small> {{ $productName }}

                                                    @foreach ($details as $detail)
                                                        @php
                                                            // Determine if $detail->color is already a hex code
                                                            $isHex = \Illuminate\Support\Str::startsWith($detail->color, '#');

                                                            $colorHex = $isHex ? $detail->color : ($hexColorMap[$detail->color] ?? '#000000');
                                                            $colorName = $isHex ? $detail->color : ($colorMap[$detail->color] ?? 'Unknown');
                                                        @endphp

                                                        @if ($detail->size)
                                                            (Size: {{ $detail->size }})
                                                        @endif

                                                        @if ($detail->color)
                                                            (Color: {{ $colorName }})
                                                            <div
                                                                style="height: 15px; width: 15px; background-color: {{ $colorHex }}; display: inline-block; margin-left: 5px; vertical-align: middle;">
                                                            </div>
                                                        @endif
                                                    @endforeach
                                                    <br>
                                                </div>
                                            @endforeach
                                        </td>

                                        <td>
                                            <p class="m-0">{{ $product->customer_name }}</p>
                                            <p class="m-0">{{ $product->customer_phone }}</p>
                                            <p class="m-0">{{ $product->shipping_address }}</p>
                                        </td>
                                        <td>
                                            <p class="m-0">{{ $product->note }}</p>
                                        </td>

                                        <td>&#2547; {{ $product->total }}</td>
                                        <td>{{ $product->delivery_status }}</td>
                                        <td>{{ $product->payment_status }}</td>

                                        <td>
                                            <a class="btn btn-sm btn-info px-1" title="edit"
                                                href="{{ route('admin.order.editstatus', $product->id) }}"><i
                                                    class="fadeIn animated bx bx-pencil"></i></a>
                                            <a class="btn btn-sm btn-info px-1" title="edit"
                                                href="{{ route('admin.order.pdf', $product->id) }}">
                                                <i class="fadeIn animated bx bx-printer"></i>
                                            </a>

                                            {{-- <button id="createSteadfastOrder" class="btn btn-primary"
                                                data-order-id="{{ $product->order_no }}">CSteadfast</button> --}}
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection



@push('js')
    <script>
        $(document).ready(function() {
            // Add CSRF token to the headers for POST requests
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            // Handle form submission
            $('.form-check-input').on('change', function() {
                var isChecked = $(this).is(':checked'); // Get checked status (true or false)
                // var checkboxId = $(this).attr('id'); // Get dynamic ID of the checkbox
                var itemId = $(this).data('id'); // Optionally send an item ID (or other data)

                $.ajax({
                    url: '{{ route('admin.product.update.status') }}', // URL to your route
                    type: 'POST',
                    data: {
                        status: isChecked, // Send checked status
                        id: itemId // Optionally send item ID
                    },

                    success: function(response) {
                        if (response.success) {
                            toastr.success(response.message);
                        } else {
                            toastr.warning(response.message);
                        }
                    },
                    error: function(xhr, status, error) {
                        toastr.error('An error occurred: ' + xhr.responseText);
                    }
                });
            });
        });
    </script>

    <script>
        $(document).ready(function() {
            // Initialize DataTable
            var table = $('#example').DataTable();

            // Handle Select All Checkbox
            $('#selectAll').on('click', function() {
                var rows = table.rows({
                    'search': 'applied'
                }).nodes();
                $('input[type="checkbox"].select-row', rows).prop('checked', this.checked);
            });

            // Handle Row Checkbox Selection
            $('#example tbody').on('change', '.select-row', function() {
                if (!this.checked) {
                    var el = $('#selectAll').get(0);
                    if (el && el.checked && ('indeterminate' in el)) {
                        el.indeterminate = true;
                    }
                }
            });
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelectorAll('.print-btn').forEach(function(button) {
                button.addEventListener('click', function() {
                    let orderId = this.getAttribute('data-order-id');
                    let row = this.closest('tr'); // Get the specific row
                    let table = row.closest('table'); // Get the entire table
                    let thead = table.querySelector('thead').cloneNode(true); // Clone the thead
                    let clonedRow = row.cloneNode(true); // Clone the current row

                    // Remove the last column (Action) from the headers and row
                    thead.querySelector('tr').lastElementChild.remove();
                    clonedRow.lastElementChild.remove();

                    // Open an empty window to print
                    let printWindow = window.open('', '');
                    printWindow.document.write('<html><head>');
                    printWindow.document.write('<style>');
                    printWindow.document.write(`
                    body { font-family: Arial, sans-serif; }
                    table { width: 100%; border-collapse: collapse; margin-bottom: 30px; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    .signature { margin-top: 50px; text-align: right; }
                    .signature div { display: inline-block; border-top: 1px solid black; padding-top: 5px; width: 200px; }
                    .logo { width: 200px; height: 120px; margin-bottom: 20px; }
                `);
                    printWindow.document.write('</style></head><body>');

                    // Add the website logo at the top with the absolute URL
                    printWindow.document.write(
                        '<h1 style="text-align: center;">{{ config('app.name') }}</h1>');
                    printWindow.document.write('<h2>Order Details</h2>');
                    printWindow.document.write('<table>');
                    printWindow.document.write('<thead>' + thead.innerHTML +
                        '</thead>'); // Add table headers
                    printWindow.document.write('<tbody><tr>' + clonedRow.innerHTML +
                        '</tr></tbody>'); // Add selected row
                    printWindow.document.write('</table>');

                    // Add Signature Section
                    printWindow.document.write(
                        '<div class="signature"><div>Authorized Signature</div></div>');

                    printWindow.document.write('</body></html>');
                    printWindow.document.close();
                    printWindow.print();

                    // Now, generate the PDF with jsPDF
                    const {
                        jsPDF
                    } = window.jspdf;
                    const doc = new jsPDF();

                    // Set the document title
                    doc.text('{{ config('app.name') }}', 105, 10, null, null, 'center');
                    doc.text('Order Details', 105, 20, null, null, 'center');

                    // Add the table data and styling to the PDF
                    doc.autoTable({
                        head: [Array.from(thead.querySelectorAll('th')).map(th => th
                            .textContent)],
                        body: [
                            [...clonedRow.querySelectorAll('td')].map(td => td
                                .textContent)
                        ],
                        startY: 30,
                        theme: 'grid',
                    });

                    // Add signature section
                    doc.text('Authorized Signature', 180, doc.lastAutoTable.finalY + 20, {
                        align: 'right'
                    });

                    // Generate a random number for the filename
                    let randomNumber = Math.floor(Math.random() *
                        1000000); // Random number between 0 and 1,000,000
                    let filename = `{{ config('app.name') }}_${randomNumber}.pdf`;

                    // Save the PDF with the random filename
                    doc.save(filename);
                });
            });
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {

            const apiKey = '{{ env('Api_Key') }}';
            const secretKey = '{{ env('Secret_Key') }}';

            document.querySelectorAll('#createSteadfastOrder').forEach(function(button) {
                button.addEventListener('click', function() {
                    let orderId = this.getAttribute('data-order-id');
                    if (!orderId) {
                        console.log('Order ID is missing!');
                        return;
                    }

                    let row = this.closest('tr');

                    let orderNo = row.querySelector('td:nth-child(2)').textContent.trim();
                    let productDetails = row.querySelector('td:nth-child(3)').textContent.trim();
                    let customerCell = row.querySelector('td:nth-child(4)');
                    let notes = row.querySelector('td:nth-child(5)');
                    let amountText = row.querySelector('td:nth-child(6)').textContent.trim();

                    let amount = parseFloat(amountText.replace(/[^\d.-]/g, ''));
                    let customerName = customerCell.querySelector('p:nth-child(1)').textContent
                        .trim();
                    let customerPhone = customerCell.querySelector('p:nth-child(2)').textContent
                        .trim();
                    let customerAddress = customerCell.querySelector('p:nth-child(3)').textContent
                        .trim();

                    const dataToSend = {
                        "invoice": orderId,
                        "recipient_name": customerName,
                        "recipient_phone": customerPhone,
                        "recipient_address": customerAddress,
                        "cod_amount": amount,
                        "note": notes,
                    };

                    fetch(`https://portal.packzy.com/api/v1/create_order`, {
                            method: 'POST',
                            headers: {
                                'Api-Key': apiKey,
                                'Secret-Key': secretKey,
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': '{{ csrf_token() }}'
                            },
                            body: JSON.stringify(
                                dataToSend)
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.status === 200) {
                                toastr.success(data.message);
                            } else {
                                toastr.error('Error: ' + (data.message ||
                                    'Failed to create consignment.'));
                            }
                        })
                        .catch(error => {
                            toastr.error('An error occurred.');
                        });
                });
            });
        });
    </script>
@endpush
