@extends('frontend.components.layout')

@section('title')
    Privacy Policy
@endsection


@section('content')

<div class="container py-5">

    <h2 class="mb-4 text-center" style="padding-top: 40px">Privacy Policies</h2>

    @if($policies->count() > 0)

        @foreach($policies as $policy)
            <div class="mb-4 p-3 border rounded bg-light">
                <h4>{{ $policy->title }}</h4>
                <p>{!! $policy->content !!}</p>
            </div>
        @endforeach

    @else
        <div class="alert alert-warning text-center">
            No privacy policies found.
        </div>
    @endif

</div>

@endsection

