@extends('admin.contact.base')
@section('action-content')  
        <div class="row">
            <div class="col-md-12 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading" style="height: 45px;">
                    	<div class="col-xs-6">Thông tin liên hệ </div>
                    	<div class="col-xs-6">
                    		<a href="{{ route('contact.edit',['id' => $contact->id])}}" class="btn btn-primary" style="margin-top: -3px;float: right;">Chỉnh sửa</a>
                    	</div>
                    </div>
                    <div class="panel-body">
						<table class="table table-bordered" style="margin-top:20px;">
							<tbody>
								<tr class="bg-info">
									<th>Tên công ty</th>
									<td>{!!$contact->company!!}</td>
								</tr>
								<tr class="bg-info">
									<th>Địa chỉ</th>
									<td>{!!$contact->address!!}</td>
								</tr>
								<tr class="bg-info">
									<th>Số điện thoại</th>
									<td>{!!$contact->numberphone!!}</td>
								</tr>
								<tr class="bg-info">
									<th>Email</th>
									<td>{!!$contact->email!!}</td>
								</tr>
								<tr class="bg-info">
									<th>Url website</th>
									<td>{!!$contact->website!!}</td>
								</tr>
								<tr class="bg-info">
									<th>Google map</th>
									<td>{!!$contact->map!!}</td>
								</tr>
								<tr>
								</tr>
						</tbody>
						</table>
                    </div>
                </div>
            </div>
        </div>
@endsection('action-content')