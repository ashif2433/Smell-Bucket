@extends('admin.layouts.app')

@section('content')

<h2>Add Privacy Policy</h2>

<form action="{{ route('privacy.store') }}" method="POST" enctype="multipart/form-data">
    @csrf

    <div class="mb-3">
        <label>Title:</label>
        <input type="text" name="title" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Content:</label>
        <textarea id="summernote" name="content" class="form-control">
            {{ old('content') }}
        </textarea>
    </div>

    <button class="btn btn-success">Save</button>
</form>

@endsection

@push('js')
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 500,
            placeholder: 'Write your privacy policy here...'
        });
    });
</script>
@endpush
