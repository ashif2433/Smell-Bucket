@extends('frontend.components.layout')

@section('title')
    Refund Policy
@endsection


@section('topmenu')
    @include('frontend.components.topmenu')
@endsection
@push('css')

@endpush

@section('content')
    <main class="container main py-5">
        <h1 class="text-center">B 2 B Policy</h1>
        <div class="mt-3"></div>
        <ol style="list-style: auto;">
            @foreach ($btob as $item)
                <li class="mb-2">{{ $item->details }}</li>
            @endforeach
        </ol>
    </main>
@endsection

@push('js')

@endpush
