@extends('admin.layouts.app')
@section('title')
Terms
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
            <h6 class="mb-0 text-uppercase">Refund Policy Create</h6>
        </div>
    </div>
    <hr />
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.refundstore') }}"  method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-10">
                                <textarea cols="30" rows="4" id="rdetails" class="form-control" name="rdetails" placeholder="Refund details" required style="max-width: 100% !important;"></textarea>
                            </div>
                            {{-- <div class="col-6">
                                <textarea cols="30" rows="5" id="answer" class="form-control" name="answer" placeholder="Answer" required style="max-width: 100% !important;"></textarea>
                            </div> --}}
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

