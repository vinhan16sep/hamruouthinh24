@extends('admin.category.base')

@section('action-content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">Thêm mới danh mục sản phẩm</div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" method="POST" action="{{ route('category.update', ['id' => $category->id]) }}" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                <label for="name" class="col-md-4 control-label">Tên danh mục</label>

                                <div class="col-md-6">
                                    <input id="name" type="text" class="form-control" name="name" value="{{ $category->name }}" autofocus>

                                    @if ($errors->has('name'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('slug') ? ' has-error' : '' }}">
                                <label for="name" class="col-md-4 control-label">Slug</label>

                                <div class="col-md-6">
                                    <input id="slug" type="text" class="form-control" name="slug" value="{{ $category->slug }}" required readonly>

                                    @if ($errors->has('slug'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('slug') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <input type="hidden" name="is_active" value="0">
                            <div class="form-group{{ $errors->has('is_active') ? ' has-error' : '' }}">
                                <label for="is_active" class="col-md-4 control-label">Dùng danh mục?</label>

                                <div class="col-md-6">
                                    <input id="is_active" type="checkbox" class="minimal" name="is_active" value="1"
                                        @if($category->is_active == 1)
                                            checked
                                        @endif
                                    >
                                    @if ($errors->has('is_active'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('is_active') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('trademark_id') ? ' has-error' : '' }}">
                                <label for="trademark_id" class="col-md-4 control-label">Thương hiệu</label>

                                <div class="col-md-6">
                                    <select name="trademark_id">
                                        <option value="">Chọn thương hiệu</option>
                                        @if(!empty($trademarks))
                                        @foreach($trademarks as $key => $item)
                                            <option value="{{ $key }}"
                                            @if ($category->trademark_id == $key) selected="selected" @endif>
                                            {{ $item }}</option>
                                        @endforeach
                                        @endif
                                    </select>
                                    @if ($errors->has('trademark_id'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('trademark_id') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="avatar" class="col-md-4 control-label" >Hình ảnh</label>
                                <div class="col-md-6">
                                    <input type="file" id="image" name="image">
                                </div>
                                {{ HTML::image('storage/app/' . $category->image) }}
                            </div>
                            <div class="form-group{{ $errors->has('description') ? ' has-error' : '' }}">
                                <label for="description" class="col-md-4 control-label">Giới thiệu ngắn</label>

                                <div class="col-md-6">
                                    <textarea id="description" rows="10" class="form-control" name="description" autofocus>{{ $category->description }}</textarea>

                                    @if ($errors->has('description'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('description') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <button type="submit" class="btn btn-primary">
                                        OK
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
