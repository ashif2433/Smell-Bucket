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
            <h6 class="mb-0 text-uppercase">B 2 B in Create index</h6>
        </div>
    </div>
    <hr />
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.btobstore') }}"  method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            {{-- <div class="col-10">
                                <input type="file" class="form-control" name="img">
                            </div> --}}
                            <div class="col-10">
                                <textarea cols="30" rows="10" id="answer" class="form-control" name="details" placeholder="details" required style="max-width: 100% !important;"></textarea>
                            </div>
                            <div class="col-2">
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

