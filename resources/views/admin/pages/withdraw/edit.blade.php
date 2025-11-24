@extends('admin.layouts.app')
@section('title')
    Edit Withdrawal
@endsection

@section('content')
    <hr />
    <div class="row">
        <div class="col-lg-10 offset-lg-1">
            <div class="d-flex justify-content-between mb-3">
                <div>
                    <h6 class="mb-0 text-uppercase">Edit Withdraw</h6>
                </div>

            </div>
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="{{ route('admin.withdraw.update', $withdraw->id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="border p-4 rounded">
                            <input type="hidden" name="customer_id" value="{{ $withdraw->customer->id }}">
                            <div class="row mb-3">
                                <label for="inputPhoneNo2" class="col-lg-3 col-form-label">Customer Name <span class="text-danger">*</span></label>
                                <div class="col-lg-9">
                                    <input type="text" name="name" class="form-control" readonly placeholder="name" value="{{ $withdraw->customer->name }}">

                                    @error('name')
                                        <p class="mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputPhoneNo2" class="col-lg-3 col-form-label">Email <span class="text-danger">*</span></label>
                                <div class="col-lg-9">
                                    <input type="text" name="email" class="form-control" readonly placeholder="email" value="{{ $withdraw->customer->email }}">
                                    @error('email')
                                        <p class="mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="amount" class="col-lg-3 col-form-label">Amount <span class="text-danger">*</span></label>
                                <div class="col-lg-9">
                                    <input type="text" id="amount" name="amount" class="form-control" placeholder="amount" readonly value="{{ $withdraw->amount }}">

                                    @error('amount')
                                        <p class="mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="status" class="col-lg-3 col-form-label">Status <span class="text-danger">*</span></label>
                                <div class="col-lg-9">
                                    <select name="status" class="form-select" id="status" required >
                                        <option value="pending" {{ $withdraw->status === 'pending' ? 'selected' : '' }}>Pending</option>
                                        <option value="approved" {{ $withdraw->status === 'approved' ? 'selected' : '' }}>Approved</option>
                                        <option value="cancelled" {{ $withdraw->status === 'cancelled' ? 'selected' : '' }}>Cancelled</option>
                                    </select>

                                    @error('status')
                                        <p class="mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="transaction_id" class="col-lg-3 col-form-label">Transaction ID <span class="text-danger">*</span></label>
                                <div class="col-lg-9">
                                    <input type="text" id="transaction_id" name="transaction_id" class="form-control" placeholder="transaction id" value="{{ $withdraw->transaction_id }}">

                                    @error('transaction_id')
                                        <p class="mb-0 text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>


                            <div class="form-group text-end">
                                <label class="col-form-label"></label>
                                <button type="submit" class="btn btn-dark px-5">Update</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
