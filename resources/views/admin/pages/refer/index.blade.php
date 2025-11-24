@extends('admin.layouts.app')
@section('title')
    Referred By
@endsection

@section('content')
    <div class="d-flex justify-content-between">
        <div>
            <h6 class="mb-0 text-uppercase">Referred By</h6>
        </div>

    </div>
    <hr />
    <div class="row">
        <div class="col">

            <div class="py-3">
                <form method="POST" action="{{ route('admin.refer.search') }}">
                    @csrf
                    <div class="row">
                        <div class="col-md-4">
                            <label for="start_date">Start Date:</label>
                            <input type="date" name="start_date" id="start_date" class="form-control" value="{{ request('start_date') }}">
                        </div>
                        <div class="col-md-4">
                            <label for="end_date">End Date:</label>
                            <input type="date" name="end_date" id="end_date" class="form-control" value="{{ request('end_date') }}">
                        </div>
                        <div class="col-md-4">
                            <label>&nbsp;</label>
                            <button type="submit" class="btn btn-primary d-block px-5 py-1">
                            Filter @if (!empty($count)) <small class="text-bg-danger radius-15">({{ $count }})</small>@endif
                        </button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example2" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Sl</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Amount</th>
                                    <th>Phone</th>
                                    <th>Referred By</th>
                                    <th>Created By</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($referredBy as $refer)
                                    <tr>
                                        <td>{{ $loop->index + 1 }}</td>
                                        <td>{{ $refer->name }}</td>
                                        <td>{{ $refer->email }}</td>
                                        <td>{{ $refer->referral_balance }}</td>
                                        <td>{{ $refer->phone }}</td>
                                        <td>{{ $refer->referral?->name }}</td>
                                        <td>{{ \Carbon\Carbon::parse($refer->created_at)->format('d/m/Y') }}</td>
                                        {{-- <td>
                                            @foreach ($refer->referredCustomers as $item)
                                                <span>{{ $item->name }}</span>
                                            @endforeach
                                        </td> --}}
                                        <td>
                                            <a class="btn btn-sm btn-info" href="{{ route('admin.refer.edit', $refer->id) }}"><i class="fadeIn animated bx bx-pencil"></i></a>
                                            <a class="btn btn-sm btn-danger" href="{{ route('admin.refer.delete', $refer->id) }}"><i class="fadeIn animated bx bx-trash-alt"></i></a>
                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
