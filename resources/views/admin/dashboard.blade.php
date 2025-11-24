@extends('admin.layouts.app')
@section('title')
    Dashboard
@endsection

@push('css')
<style>

    #resdas {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        gap: 20px
    }

    #resdas .card{
        background-color: #1a2232;
        color: #fff;
    }



    @media (max-width: 1450px) {
        #resdas {
            grid-template-columns: 1fr 1fr;
            gap: 20px
        }
    }

    @media (max-width: 600px) {
        #resdas {
            grid-template-columns: 1fr;
        }
    }

</style>
@endpush

@section('content')
@if (Auth::user()->user_type === 'admin' && Auth::user()->status === "active")

<div id="resdas">
    <a href="{{ route('admin.order.allOrders') }}">
    <div class="card py-4">
        <h3 class="text-center">Total Order</h3>
        <h2 class="text-center">{{ $orderCount }}</h2>
    </div>
    </a>
    <a href="{{ route('admin.order.pendingOrder') }}">
    <div class="card py-4">
        <h3 class="text-center">Pending Order</h3>
        <h2 class="text-center">{{ $pending }}</h2>
    </div>
    </a>
    <a href="{{ route('admin.order.deliveredOrder') }}">
    <div class="card py-4">
        <h3 class="text-center">Delivered Order</h3>
        <h2 class="text-center">{{ $delivery }}</h2>
    </div>
    </a>
    <a href="{{ route('admin.brand.index') }}">
        <div class="card py-4">
            <h3 class="text-center">Shipping Order</h3>
            <h2 class="text-center">{{ $shipping }}</h2>
        </div>
    </a>
    <a href="{{ route('admin.order.cancelledOrder') }}">
    <div class="card py-4">
        <h3 class="text-center">Cancelled Order</h3>
        <h2 class="text-center">{{ $cancelled }}</h2>
    </div>
    </a>
    <div class="card py-4">
        <h3 class="text-center">Total Delivery amount</h3>
        <h2 class="text-center">{{ $totalDeliveredAmount }}</h2>
    </div>
    <div class="card py-4">
        <h3 class="text-center">Total Pending amount</h3>
        <h2 class="text-center">{{ $totalPendingAmount }}</h2>
    </div>
    <a href="{{ route('admin.product.index') }}">
    <div class="card py-4">
        <h3 class="text-center">Total Product</h3>
        <h2 class="text-center">{{ $product }}</h2>
    </div>
    </a>

    <div class="card py-4">
        <h3 class="text-center">Total Custmer</h3>
        <h2 class="text-center">{{ $customer }}</h2>
    </div>
</div>
@else
    <p>Unauthorized User Type</p>
    <p>Ask the developer for add you as a admin</p>
@endif
@endsection
@push('js')
@endpush
