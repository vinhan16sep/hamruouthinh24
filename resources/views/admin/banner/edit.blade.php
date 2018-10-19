              
@extends('admin.contact.base')
@section('action-content')          
	<div class="content">
        <div class="row">
            <div class="col-md-12 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Chỉnh sửa liên hệ </div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" method="POST" action="{{ route('banner.update',['id' => $banner->id])}}" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
                            <label class="control-label" >Hình ảnh banner đang có</label>
                            <div class="form-group">
                                <?php if (!empty(json_decode($banner->image,true))): ?>
                                    <?php foreach (json_decode($banner->image,true) as $key => $value): ?>
                                            <div class="col-md-4 banner" style="height: 200px;margin-top: 20px;">
                                                {{ HTML::image('storage/app/banner/' . $value) }}
                                                <i class="fa-2x fa fa-remove remove-image" style="cursor: pointer; position: absolute;color:red; top:0px;right: 15px;" aria-hidden="true" data-image="<?php echo $value;?>" ></i>
                                            </div>
                                    <?php endforeach ?>
                                <?php else:?>
                                    Chưa có banner nào
                                <?php endif ?>
                            </div>
                            <label for="image" class="control-label" >Hình ảnh banner</label>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="file" id="image" class="form-control" name="image[]" multiple>
                                </div>
                            </div>
                            <button class="btn btn-primary">OK</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('.remove-image').click(function(){
            console.log(1);
            if(confirm('Chắc chắn xóa?')){
                var url = window.location.origin;
                var check = $(this);
                var image = $(this).data('image');
                var token = $('#token').val();
                $.ajax({
                    url: url + '/hamruouthinh24/admin/banner/deleteBanner',
                    method: 'POST',
                    data: {
                        image : image, _token : token
                    },
                    success: function(res){
                        check.parent('div').fadeOut();
                        console.log(res.image_json);
                    },
                });
            }
        });
    </script>
@endsection('action-content')