@extends('admin.banner.base')
@section('action-content') 
	<div class="content">
        <div class="row">
        	<input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
            <div class="col-md-12 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading" style="height: 45px;">
                    	<div class="col-xs-6">Banner </div>
                    	<div class="col-xs-6">
                    		<a href="{{ route('banner.edit',['id' => $banner->id])}}" class="btn btn-primary" style="margin-top: -3px;float: right;">Chỉnh sửa</a>
                    	</div>
                    </div>
                    <div class="panel-body">
                        <div class="col-xs-12">
                        	<label class="control-label" style="padding-left: 15px;margin-top: 20px">Hình ảnh banner đang có</label>
	                        <div class="form-group">
	                            <?php if (!empty(json_decode($banner->image,true))): ?>
	                                <?php foreach (json_decode($banner->image,true) as $key => $value): ?>
	                                        <div class="col-md-4 banner" style="height: 200px;margin-top: 10px;">
	                                            {{ HTML::image('storage/app/banner/' . $value) }}
	                                            <i class="fa-2x fa fa-remove remove-image" style="cursor: pointer; position: absolute;color:red; top:0px;right: 15px;" aria-hidden="true" data-image="<?php echo $value;?>" ></i>
	                                        </div>
	                                <?php endforeach ?>
	                            <?php else:?>
	                                Chưa có banner nào
	                            <?php endif ?>
	                        </div>
	                    </div>
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