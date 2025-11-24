@extends('admin.layouts.app')
@section('title')
Export Products
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
            <h6 class="mb-0 text-uppercase">Map and licence Edit</h6>
        </div>
    </div>
    <hr />
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.mapliupdate', $mapli->id) }}"  method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-6">
                                <textarea cols="30" rows="5" id="question" class="form-control" name="map" placeholder="Question" required style="max-width: 100% !important;">{{ $mapli->map }}</textarea>
                            </div>
                            <div class="col-4">
                                <input type="text" name="licence" class="form-control" value="{{ $mapli->licence }}">
                            </div>
                            <div class="col-2 mt-4">
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')

@endpush

