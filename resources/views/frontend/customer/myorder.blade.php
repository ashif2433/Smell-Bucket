@extends('frontend.components.layout')

@section('title')
    My Order
@endsection

@section('topmenu')
    @include('frontend.components.topmenu')
@endsection

@section('content')
    <main class="main">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                    <li class="breadcrumb-item active" aria-current="page">My Order</li>
                </ol>
            </div><!-- End .container -->
        </nav>

        <div class="container">
            <div class="row">
                @include('frontend.customer.leftmenu')
                <div class="col-lg-9 order-lg-last dashboard-content">
                    {{-- <div class="row">
                        <div class="col"> --}}
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="example" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th><input type="checkbox" id="selectAll"></th>
                                                    <th>Order No</th>
                                                    <th>Tracking Code</th>
                                                    <th>Date</th>
                                                    <th>Customer info</th>
                                                    <th>Payment</th>
                                                    <th>Payment Status</th>
                                                    <th>Total</th>
                                                    <th>Delivery Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($orders as $order)
                                                    @if ($order->customer_phone === $customer->phone)
                                                        <tr>
                                                            <td><input type="checkbox" id="selectAll"></td>
                                                            <td>{{ $order->order_no }}</td>
                                                            <td>{{ $order->tracking_code }}</td>
                                                            <td>{{ $order->date }}</td>
                                                            <td>{{ $order->customer_name }} <br>
                                                                {{ $order->customer_phone }} <br>
                                                                {{ $order->shipping_address }}
                                                            </td>
                                                            <td>{{ $order->payment_type }}</td>
                                                            <td>{{ $order->payment_status }}</td>
                                                            <td>{{ $order->total }}</>
                                                            <td>{{ $order->delivery_status }}</td>
                                                        </tr>
                                                    @endif
                                                @endforeach

                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        {{-- </div>
                    </div> --}}
                </div>
            </div>
        </div>

        <div class="mb-5"></div><!-- margin -->
    </main><!-- End .main -->

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
@endpush
