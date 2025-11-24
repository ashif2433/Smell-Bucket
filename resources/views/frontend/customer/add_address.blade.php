@extends('frontend.components.layout')

@section('title')
    My Account
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
                    <li class="breadcrumb-item active" aria-current="page">Address Add</li>
                </ol>
            </div><!-- End .container -->
        </nav>

        <div class="container">
           <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">Office Address</div>
                    <div class="card-body">
                            <form action="{{ route('customer.address_update', $customer->id) }}" method="POST">
                                @csrf
                                <div class="form-floating">
                                    <textarea class="form-control" name="address2" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px">{{ $customer->address2 ?? 'No address found' }}</textarea>
                                    <label for="floatingTextarea2">Office Address</label>
                                </div>
                                <button type="submit" class="btn btn-primary">Add</button>
                            </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">Home Address</div>
                    <div class="card-body">
                        <form action="{{ route('customer.address_update2', $customer->id) }}" method="POST">
                            @csrf
                            <div class="form-floating">
                                <textarea class="form-control" name="address3" placeholder="Leave a comment here" id="floatingTextarea3" style="height: 100px">{{ $customer->address3 ?? 'No address found' }}</textarea>
                                <label for="floatingTextarea3">Home Address</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </div>
                </div>
            </div>
           </div>

        </div><!-- End .container -->

        <div class="mb-5"></div><!-- margin -->
    </main><!-- End .main -->

@endsection

@push('js')
{{-- <script>
    $(document).ready(function () {
        $('#saveReferral').click(function () {
            let referralCode = $('#referral_code').val();
            let customerId = $('input[name="customer_id"]').val();

            $.ajax({
                url: "{{ route('customer.addReferral') }}",
                method: "POST",
                data: {
                    _token: "{{ csrf_token() }}",
                    customer_id: customerId,
                    referral_code: referralCode
                },
                success: function (response) {
                    if (response.success) {
                        $('#referralMessage').removeClass('text-danger').addClass('text-success').text(response.message);
                        location.reload(); // Refresh the page to update referral info
                    } else {
                        $('#referralMessage').text(response.message);
                    }
                }
            });
        });
    });

</script> --}}
@endpush
