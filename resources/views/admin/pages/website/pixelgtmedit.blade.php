@extends('admin.layouts.app')
@section('title')
    Company Information
@endsection

@section('content')
    <div class="d-flex justify-content-between">
        <div>
            <h6 class="mb-0 text-uppercase">PIxel Gtm</h6>
        </div>
        <div>
        </div>
    </div>
    <hr />

    <form method="POST" action="{{ route('admin.pixelGtmupdate', $pixelgtm->id) }}" enctype="multipart/form-data">
        @csrf
        <div class="row">
            <div class="col-md-6">
                <div class="card p-3">
                    <h4>Pixel Id</h4>
                    <div class="card-body">
                        <input name="pixel" class="form-control" placeholder="123456789012345" value="{{ $pixelgtm->pixel }}">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card p-3">
                    <h4>Google Tag Manager Id</h4>
                    <div class="card-body">
                        <input name="gtm" class="form-control" placeholder="GTM-ABC1234" value="{{ $pixelgtm->gtm }}">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <input type="submit" class="btn btn-primary">
            </div>
        </div>
    </form>
@endsection


@push('css')

@endpush
@push('js')

@endpush
