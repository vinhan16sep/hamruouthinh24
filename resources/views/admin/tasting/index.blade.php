@extends('admin.tasting.base')
@section('action-content')
    <!-- Main content -->
    <section class="content">
        <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-sm-6"></div>
                    <div class="col-sm-6"></div>
                </div>
                <form method="POST" action="">
                {{ csrf_field() }}
                </form>
                <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                <thead>
                                <tr role="row">
                                    <th width="20%" class="" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Name: activate to sort column descending" aria-sort="ascending">Tên khách hàng</th>
                                    <th width="20%" class=" hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending">Thời gian</th>
                                    <th width="20%" class=" hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending">Sản phẩm</th>
                                    <th width="15%" class=" hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending">Trạng thái</th>
                                    <th width="10%" class=" hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending">Chi tiết</th>
                                    @if(Request::segment(3) != 'finish')
                                    <th tabindex="0" aria-controls="example2" rowspan="1" colspan="2" aria-label="Action: activate to sort column ascending">Hành động</th>
                                    @endif
                                </tr>
                                </thead>
                                <tbody>
                                    
                                    @foreach($tasting as $value)
                                    <tr role="row" class="odd" id="row_{{ $value->id }}">
                                        <td class="sorting_1">{{ $value->customer_name }}</td>
                                        <td class="sorting_1">{{ $value->time }}</td>
                                        <td class="sorting_1">{{ $value->product_name }}</td>
                                        <td>
                                            @if($value->status == 0)
                                                Chờ xác nhận
                                            @else
                                                Đã hoàn thành
                                            @endif
                                        </td>
                                        <td>
                                            <button class="btn btn-primary" type="button" data-toggle="collapse" href="#{{ $value->id }}" aria-expanded="false" aria-controls="messageContent">Chi tiết</button>
                                        </td>
                                        
                                        <td>
                                            @if(Request::segment(3) != 'finish')
                                            <a href="" class="btn btn-warning col-sm-5 col-xs-5 btn-margin btn-finish" data-id="{{ $value->id }}">
                                                Xác nhận
                                            </a>
                                            @endif
                                            {{--<a href="" class="btn btn-danger col-sm-5 col-xs-5 btn-margin" >
                                                Bỏ qua đơn hàng
                                            </a>--}}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="7" class="no_border">
                                            <div class="collapse" id="{{ $value->id }}">
                                                <div clas="row">
                                                    <div class="col-md-6">
                                                        <strong>Email:</strong> {{ $value->customer_email }}
                                                        <br>
                                                        <strong>Số điện thoại:</strong> {{ $value->customer_phone }}
                                                        <br>
                                                        <strong>Địa chỉ:</strong> {{ $value->customer_address }} - {{ $value->customer_district }} - {{ $value->customer_city }}
                                                        <br>
                                                        <strong>Nội dung:</strong> {{ $value->customer_content }}
                                                    </div>
                                                    {{--<div class="col-md-6">
                                                        <h4>Thông tin đơn hàng:</h4>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 50%;"><strong>Tên sản phẩm</strong></td>
                                                                <td style="width: 25%;"><strong>Số lượng</strong></td>
                                                                <td style="width: 25%;"><strong>Giá trị</strong></td>
                                                            </tr>
                                                        </table>
                                                        <hr>
                                                        <strong>Tổng giá tiền: </strong>
                                                    </div>--}}
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th width="20%" rowspan="1" colspan="1">Tên khách hàng</th>
                                    <th class="hidden-xs" width="10%" rowspan="1" colspan="1">Thời gian</th>
                                    <th class="hidden-xs" width="10%" rowspan="1" colspan="1">Sản phẩm</th>
                                    <th class="hidden-xs" width="10%" rowspan="1" colspan="1">Trạng thái</th>
                                    <th class="hidden-xs" width="10%" rowspan="1" colspan="1">Chi tiết</th>
                                    @if(Request::segment(3) != 'finish')
                                    <th rowspan="1" colspan="2">Hành động</th>
                                    @endif
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        {{--<div class="col-sm-5">
                            <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">Hiển thị  sản phẩm</div>
                        </div>--}}
                        <div class="col-sm-7">
                            <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                                {{ $tasting->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
    </section>
    <!-- /.content -->
    </div>
@endsection