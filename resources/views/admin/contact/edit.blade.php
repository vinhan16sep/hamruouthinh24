              
@extends('admin.contact.base')
@section('action-content')          
	<div class="container">
        <div class="row">
            <div class="col-md-12 col-md-offset-0">
                <div class="panel panel-default">
                    <div class="panel-heading">Chỉnh sửa liên hệ </div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" method="POST" action="{{ route('contact.update',['id' => $contact->id])}}" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
                            <div class="form-group{{ $errors->has('company') ? ' has-error' : '' }}">
                                <label for="company" class="col-md-2 control-label">Tên công ty</label>
                                <div class="col-md-8">
                                    <input id="company" type="text" class="form-control" name="company" value="{{ $contact->company }}" autofocus>
                                    @if ($errors->has('company'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('company') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('address') ? ' has-error' : '' }}">
                                <label for="address" class="col-md-2 control-label">Địa chỉ</label>
                                <div class="col-md-8">
                                    <input id="address" type="text" class="form-control" name="address" value="{{ $contact->address }}" autofocus>
                                    @if ($errors->has('address'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('address') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('numberphone') ? ' has-error' : '' }}">
                                <label for="numberphone" class="col-md-2 control-label">Số điện thoại</label>
                                <div class="col-md-8">
                                    <input id="numberphone" type="text" class="form-control" name="numberphone" value="{{ $contact->numberphone }}" autofocus>
                                    @if ($errors->has('numberphone'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('numberphone') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                <label for="email" class="col-md-2 control-label">Email</label>
                                <div class="col-md-8">
                                    <input id="email" type="text" class="form-control" name="email" value="{{ $contact->email }}" autofocus>
                                    @if ($errors->has('email'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('website') ? ' has-error' : '' }}">
                                <label for="website" class="col-md-2 control-label">Url website</label>
                                <div class="col-md-8">
                                    <input id="website" type="text" class="form-control" name="website" value="{{ $contact->website }}" autofocus>
                                    @if ($errors->has('website'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('website') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('map') ? ' has-error' : '' }}">
                                <label for="map" class="col-md-2 control-label">Google map</label>
                                <div class="col-md-8">

                                	<input type="hidden" id="textarea"  value="{{htmlentities($contact->map)}}" />
                                	<textarea id="map" name="map" class="form-control" rows=5>
                                	</textarea>
                                    @if ($errors->has('map'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('map') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <button class="btn btn-primary col-md-offset-2">OK</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection('action-content')