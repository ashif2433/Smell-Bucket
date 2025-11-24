@extends('frontend.components.layout')

@section('title')
    Withdraw Balance
@endsection

@push('css')
    <style>
        .form-check-input {
            height: 1.3em;
        }

        tbody,
        td,
        tfoot,
        th,
        thead,
        tr {
            border: 1px solid;
        }

        form {
            margin-bottom: 0;
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
                    <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                </ol>
            </div><!-- End .container -->
        </nav>

        <div class="container">
            <div class="row">
                @include('frontend.customer.leftmenu')
                <div class="col-lg-9 order-lg-last dashboard-content">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-head">
                                    <p class="px-4 pb-0 pt-3 mb-0"><strong>My Point</strong></p>

                                </div>
                                @if ($customer->referredCustomers->count() > 0)
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <h2 class="fs-2 font1">Users Referred by You</h2>
                                            @if(is_null($customer->referral_by))
                                                <div class=""><!-- Button trigger modal -->
                                                    <button type="button" class="btn btn-primary p-2 rounded"
                                                        data-bs-toggle="modal" data-bs-target="#referred_by">
                                                        Add Referred
                                                    </button>

                                                    <!-- Modal -->
                                                    <div class="modal fade" id="referred_by" tabindex="-1"
                                                        aria-labelledby="referred_byLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content w-75">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-2" id="exampleModalCenterTitle">
                                                                        Referral Add</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                        aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form id="referralForm">
                                                                        @csrf
                                                                        <input type="hidden" name="customer_id"
                                                                            value="{{ $customer->id }}">

                                                                        <div class="mb-2">
                                                                            <label for="referral_code" class="form-label">Enter
                                                                                Referral Code</label>
                                                                            <input type="text" name="referral_code"
                                                                                id="referral_code" class="form-control" required>
                                                                        </div>

                                                                        <div id="referralMessage" class="text-danger"></div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-primary p-2 rounded"
                                                                        id="saveReferral">Submit</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            @endif
                                        </div>
                                        @if ($customer->referredCustomers->count() > 0)
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Sl</th>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Amount</th>
                                                        <th>Phone</th>
                                                        <th>Joined Date</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach ($customer->referredCustomers->take(3) as $key => $customer)
                                                        <tr>
                                                            <td>{{ $key + 1 }}</td>
                                                            <td>{{ $customer->name }}</td>
                                                            <td>{{ $customer->email }}</td>
                                                            <td>&#2547; {{ $customer->referral_balance }}</td>
                                                            <td>{{ $customer->phone }}</td>
                                                            <td>{{ $customer->created_at->format('d M Y') }}</td>
                                                        </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        @else
                                            <p>No referred users yet.</p>
                                        @endif
                                    </div>
                                @endif
                                <div class="border-bottom px-3"></div>
                                <div class="card-body">
                                    <h2 class="fs-2 font1">Payment Request</h2>
                                    <div class="table">
                                        <form action="{{ route('customer.payment.request') }}" method="POST">
                                            @csrf
                                            <div class="row g-3">


                                                <div class="col-md-6">
                                                    <input type="hidden" name="customer_id" value="{{ $customer->id }}">
                                                    <label class="form-label" for="amount">Enter Amount (Minimum 100
                                                        Tk):</label>
                                                    <input type="number" class="form-control" name="amount" required
                                                        placeholder="Enter Amount" min="100">

                                                    @error('amount')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>

                                                <div class="col-md-6">
                                                    <label for="payment_method">Payment Method</label>
                                                    <select name="payment_method" id="payment_method"
                                                        class="form-select fa-1x p-3" required>
                                                        <option value>Select payment method</option>
                                                        {{-- <option value="bank">Bank Transfer</option> --}}
                                                        <option value="mobile">Mobile Banking</option>
                                                    </select>

                                                    @error('payment_method')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-success px-5 py-3 rounded-pill">Payment
                                                Request</button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div><!-- End .col-lg-9 -->


            </div><!-- End .row -->
        </div><!-- End .container -->

        <div class="mb-5"></div><!-- margin -->
    </main><!-- End .main -->
@endsection


@push('css')
    <style>
        .dashboard-content .form-control {
            max-width: 100%;
            height: unset;
            padding: 12px;
        }
    </style>
@endpush


@push('js')
    <script>
        $(document).ready(function() {
            $('#saveReferral').click(function() {
                let referralCode = $('#referral_code').val();
                let customerId = $('input[name="customer_id"]').val();
                let referralMessage = $('#referralMessage'); // Error message div

                $.ajax({
                    url: "{{ route('customer.addReferral') }}",
                    method: "POST",
                    data: {
                        _token: "{{ csrf_token() }}",
                        customer_id: customerId,
                        referral_code: referralCode
                    },
                    success: function(response) {
                        if (response.success) {
                            referralMessage.removeClass('text-danger').addClass('text-success')
                                .text(response.message);

                            // **Clear the form fields**
                            $('#referral_code').val('');

                            // **Close the modal after a short delay**
                            setTimeout(() => {
                                $('#referred_by').modal('hide');
                                location.reload(); // Reload page to reflect changes
                            }, 1000);
                        } else {
                            referralMessage.removeClass('text-success').addClass('text-danger')
                                .text(response.message);
                        }
                    },
                    error: function(xhr) {
                        let errors = xhr.responseJSON.errors;
                        let errorMessage = "Code is not Match!";

                        if (errors) {
                            errorMessage = Object.values(errors).flat().join(' ');
                        }

                        referralMessage.removeClass('text-success').addClass('text-danger')
                            .text(errorMessage);
                    }
                });
            });

            // **Reset the form when the modal is closed**
            $('#referred_by').on('hidden.bs.modal', function() {
                $('#referral_code').val('');
                $('#referralMessage').text('');
            });
        });
    </script>
@endpush
