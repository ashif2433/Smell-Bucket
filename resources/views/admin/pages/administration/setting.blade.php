@extends('admin.layouts.app')
@section('title')
    Setting
@endsection

@section('content')
    <div class="d-flex justify-content-between">
        <div>
            <h6 class="mb-0 text-uppercase">Setting</h6>
        </div>
        <div>
        </div>
    </div>
    <hr />

    <form id="myForm" method="POST" action="{{ route('admin.setting.update', $data->id) }}" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="border p-4 rounded">
                            <div class="row mb-3">
                                <label for="inputPhoneNo2" class="col-lg-2 col-form-label">Delivery Charge (Inside Dhaka) </label>
                                <div class="col-lg-2">
                                    <input type="number" name="d_charge_inside_dhaka" class="form-control" placeholder="Charge" value="{{ old('d_charge_inside_dhaka',$data->d_charge_inside_dhaka) }}">
                                    &#2547; {{ $data->d_charge_inside_dhaka }}
                                </div>
                                <label for="inputPhoneNo2" class="col-lg-2 col-form-label">Delivery Charge (Outside Dhaka) </label>
                                <div class="col-lg-2">
                                    <input type="number" name="d_charge_outside_dhaka" class="form-control" placeholder="Charge" value="{{ old('d_charge_outside_dhaka', $data->d_charge_outside_dhaka) }}">
                                    &#2547; {{ $data->d_charge_outside_dhaka }}
                                </div>
                                <label for="urban" class="col-lg-2 col-form-label">Urban</label>
    <div class="col-lg-2">
        <input type="number" name="urban" id="urban" class="form-control" placeholder="Enter urban code"
               value="{{ old('urban', $data->urban ?? '') }}">&#2547; {{ $data->urban }}
    </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="form-group">
                    <label class="col-form-label"></label>
                    <button type="submit" class="btn btn-dark px-5">Update</button>
                </div>
            </div>
        </div>
    </form>
@endsection

