@extends('admin.layouts.app')

@section('content')
    <h2>Privacy Policies</h2>
    <a href="{{ route('privacy.create') }}" class="btn btn-primary mb-3">Add New Policy</a>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Title</th>
                <th>Content (Short)</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        @foreach($policies as $policy)
            <tr>
                <td>{{ $policy->title }}</td>
                <td>{{ Str::limit($policy->content, 50) }}</td>
                <td>
                    <a href="{{ route('privacy.edit', $policy->id) }}" class="btn btn-warning btn-sm">Edit</a>

                    <form action="{{ route('privacy.delete', $policy->id) }}" method="POST" style="display:inline;">
                        @csrf @method('DELETE')
                        <button class="btn btn-danger btn-sm">Delete</button>
                    </form>

                </td>
            </tr>
        @endforeach
        </tbody>
    </table>

@endsection
