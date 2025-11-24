@extends('admin.layouts.app')
@section('title')
    Edit Refer
@endsection

@section('content')
    <hr />
    <div class="row">
        <div class="col-lg-10 offset-lg-1">
            <div class="d-flex justify-content-between mb-3">
                <div>
                    <h6 class="mb-0 text-uppercase">Edit Refer</h6>
                </div>

            </div>
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="{{ route('admin.refer.update', $customer->id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="border p-4 rounded">
                            <div class="row mb-3">
                                <label for="inputPhoneNo2" class="col-lg-3 col-form-label">Name <span class="text-danger">*</span></label>
                                <div class="col-lg-9">
                                    <input type="text" name="name" class="form-control" placeholder="name" value="{{ $customer->name }}">
                                </div>
                                @error('name')
                                    <p class="mb-0 text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            <div class="row mb-3">
                                <label for="inputPhoneNo2" class="col-lg-3 col-form-label">Email <span class="text-danger">*</span></label>
                                <div class="col-lg-9">
                                    <input type="text" name="email" class="form-control" placeholder="email" value="{{ $customer->email }}">
                                </div>
                                @error('email')
                                    <p class="mb-0 text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            <div class="row mb-3">
                                <label for="inputPhoneNo2" class="col-lg-3 col-form-label">Phone <span class="text-danger">*</span></label>
                                <div class="col-lg-9">
                                    <input type="text" name="phone" class="form-control" placeholder="phone" value="{{ $customer->phone }}">
                                </div>
                                @error('phone')
                                    <p class="mb-0 text-danger">{{ $message }}</p>
                                @enderror
                            </div>
                            <div class="row mb-3">
                                <label for="referral_by" class="col-lg-3 col-form-label">Referred By <span class="text-danger">*</span></label>
                                <div class="col-lg-9">
                                    <select name="referral_by" class="form-select" id="referral_by"  >
                                        <option value>Select referred by</option>
                                        @foreach ($referralBy as $item)
                                            <option value="{{ $item->id }}" {{ $customer->referral_by == $item->id ? 'selected' : '' }}>{{ $item->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                                @error('referral_by')
                                    <p class="mb-0 text-danger">{{ $message }}</p>
                                @enderror
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
