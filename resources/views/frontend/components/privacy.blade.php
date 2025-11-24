@extends('layouts.app')

@section('content')
    <div class="container py-5">

        <div class="row justify-content-center ">
            <div class="col-lg-10">

                {{-- <h2 class="mb-4 text-center" style="margin-top: 200px">Privacy Policy</h2> --}}

                    @foreach($policies as $policy)
                        <div class="policy-box mb-4 p-3 border rounded">
                            <h3 class="fw-bold">{{ $policy->title }}</h3>

                            <div class="policy-content">
                                {!! $policy->content !!}
                            </div>
                        </div>
                    @endforeach

                {{-- @if($policy)
                    <div class="card shadow-sm border-0">
                        <div class="card-body" style="line-height: 1.8; font-size: 16px;">
                            {!! $policy->content !!}
                        </div>
                    </div>
                @else
                    <div class="alert alert-warning text-center">
                        No privacy policy found. Please add it from admin panel.
                    </div>
                @endif --}}

            </div>
        </div>

    </div>
@endsection
