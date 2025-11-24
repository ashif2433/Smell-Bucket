@extends('admin.layouts.app')
@section('title')
    All Products
@endsection
@push('css')
    <style>
        .form-check-input {
            height: 1.3em;
        }
    </style>
@endpush

@section('content')
    <div class="d-flex justify-content-between">
        <div>
            <h6 class="mb-0 text-uppercase">All Products Stock and price edit</h6>
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
                                    <th>Product</th>
                                    <th>Photo</th>
                                    <th>Main Price</th>
                                    <th>Stock</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($products as $product)
                                    <tr>
                                        <td><input type="checkbox" class="select-row" value="{{ $product->id }}"></td>
                                        <td>{{ $product->name }}</td>
                                        <td>
                                            @php
                                                $thumbnail = json_decode($product->thumbnail, true);
                                            @endphp
                                            <img src="{{ $thumbnail ? singlePhoto($thumbnail) : asset('default-image.jpg') }}" alt="no img" style="width: 60px">
                                        </td>

                                        <form class="stock-update-form" data-id="{{ $product->id }}">
                                            @csrf
                                            <td>
                                                <input type="number" class="form-control update-field" name="selling_price" value="{{ $product->selling_price }}">
                                            </td>
                                            <td>
                                                <input type="number" class="form-control update-field" name="quantity" value="{{ $product->quantity }}">
                                            </td>
                                            <td>
                                                <button type="submit" class="btn btn-success">Update</button>
                                            </td>
                                        </form>
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
    $(document).on('submit', '.stock-update-form', function(e) {
        e.preventDefault();

        let form = $(this);
        let productId = form.data('id');
        let formData = form.serialize();

        $.ajax({
            url: `/admin/stockpriceupdate/${productId}`,
            method: 'POST',
            data: formData,
            headers: {
                'X-CSRF-TOKEN': $('input[name="_token"]').val()
            },
            success: function(response) {
                toastr.success("Update successfully");
            },
            error: function(xhr) {
                alert('Something went wrong!');
                console.error(xhr.responseText);
            }
        });
    });
</script>
@endpush
