@extends('admin.introduce.base')

@section('action-content')
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" method="POST" action="{{ route('introduce.saveIntroduce', ['id' => $data->slug]) }}" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            <div class="form-group">
                                <label for="" class="col-md-2 control-label">Ảnh hiện tại</label>
                                <div class="col-md-8">
                                    {{ HTML::image('storage/app/' . $data->image,'a picture',array('width' => '100%')) }}
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                                <label for="title" class="col-md-2 control-label">Tên bài viết</label>
                                <div class="col-md-8">
                                    <input id="title" type="text" class="form-control" name="title" value="{{ $data->title }}" required readonly autofocus>
                                    @if ($errors->has('title'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('title') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('slug') ? ' has-error' : '' }}">
                                <label for="slug" class="col-md-2 control-label">Slug</label>
                                <div class="col-md-8">
                                    <input id="slug" type="text" class="form-control" name="slug" value="{{ $data->slug }}" required readonly>
                                    @if ($errors->has('slug'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('slug') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="avatar" class="col-md-2 control-label" >Hình ảnh</label>
                                <div class="col-md-8">
                                    <input type="file" id="image" name="image">
                                </div>
                            </div>
                            <?php if ($data->slug == 'dang-ky-thu-ruou'): ?>
                                <div class="form-group{{ $errors->has('description') ? ' has-error' : '' }}">
                                    <label for="description" class="col-md-2 control-label">Giới thiệu</label>

                                    <div class="col-md-8">
                                        <textarea id="description" rows="10" class="form-control" name="description" style="width: 100%;">{{ $data->description }}</textarea>

                                        @if ($errors->has('description'))
                                            <span class="help-block">
                                            <strong>{{ $errors->first('description') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            <?php endif ?>
                            <?php if ($data->slug == 've-chung-toi'): ?>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-xs-12" style="padding: 0px 160px;">
                                            <div class="col-md-4{{ $errors->has('description1') ? ' has-error' : '' }}">
                                                <label for="description1" class="col-md-12 control-label" style="text-align: left;">Hỗ trợ qua điện thoại</label>
                                                <div class="col-md-12">
                                                    <textarea id="description1" rows="6" class="form-control" name="description1" style="width: 100%;"><?php echo json_decode($data->description)[0] ?></textarea>

                                                    @if ($errors->has('description1'))
                                                        <span class="help-block">
                                                        <strong>{{ $errors->first('description1') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-md-4{{ $errors->has('description2') ? ' has-error' : '' }}">
                                                <label for="description2" class="col-md-12 control-label" style="text-align: left;">Miễn phí giao hàng</label>
                                                <div class="col-md-12">
                                                    <textarea id="description2" rows="6" class="form-control" name="description2" style="width: 100%;"><?php echo json_decode($data->description)[1] ?></textarea>

                                                    @if ($errors->has('description2'))
                                                        <span class="help-block">
                                                        <strong>{{ $errors->first('description2') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-md-4{{ $errors->has('description3') ? ' has-error' : '' }}">
                                                <label for="description3" class="col-md-12 control-label" style="text-align: left;">Hỗ trợ người mua hàng</label>

                                                <div class="col-md-12">
                                                    <textarea id="description3" rows="6" class="form-control" name="description3" style="width: 100%;"><?php echo json_decode($data->description)[2] ?></textarea>

                                                    @if ($errors->has('description3'))
                                                        <span class="help-block">
                                                        <strong>{{ $errors->first('description3') }}</strong>
                                                    </span>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            <?php endif ?>
                            <div class="form-group{{ $errors->has('content') ? ' has-error' : '' }}">
                                <label for="content" class="col-md-2 control-label"><?php echo ($data->slug == 'dang-ky-thu-ruou') ? 'Hướng dẫn thử rượu' : 'Nội dung';?></label>

                                <div class="col-md-8">
                                    <textarea id="content" rows="10" class="form-control tinymce" name="content">{{ $data->content }}</textarea>

                                    @if ($errors->has('content'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('content') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2 col-md-offset-9">
                                        <button type="button" onclick="enableEdit()" class="btn btn-primary enable-edit">
                                            Bật chế độ sửa
                                        </button>
                                    </div>
                                    <div class="col-md-2 col-md-offset-9 btn-submit">
                                        <button type="submit" class="btn btn-primary">
                                            OK
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
