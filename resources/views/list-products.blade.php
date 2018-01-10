@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/store.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="ProductController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="row">
                <div class="category col-md-3 col-sm-3 col-xs-12">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading">Danh mục sản phẩm</div>

                        <!-- List group -->
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="javascript:void(0);">Rượu</a>
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <a href="javascript:void(0);">Rượu vang</a>
                                        <ul class="list-group">
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Vang đỏ</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Vang nổ</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Vang ngọt</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Vang khác</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="javascript:void(0);">Rượu mạnh</a>
                                        <ul class="list-group">
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Chivas</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Whiskey</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Ballentines</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Rượu mạnh khác</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="javascript:void(0);">Rượu pha chế</a>
                                        <ul class="list-group">
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Rượu pha chế I</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Rượu pha chế II</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Rượu pha chế III</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Rượu pha chế khác</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="javascript:void(0);">Rượu khác</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="list-group-item">
                                <a href="javascript:void(0);">Bia</a>
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <a href="javascript:void(0);">Bia I</a>
                                        <ul class="list-group">
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Bia I</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Bia II</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Bia III</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Bia khác</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="javascript:void(0);">Bia II</a>
                                        <ul class="list-group">
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Bia I</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Bia II</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Bia III</a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0);">Bia khác</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="javascript:void(0);">Bia khác</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="list-group-item">
                                <a href="javascript:void(0);">Bánh kẹo</a>
                            </li>
                            <li class="list-group-item">
                                <a href="javascript:void(0);">Sản phẩm khác</a>
                            </li>
                        </ul>
                    </div>

                    <div class="panel panel-default filter">
                        <div class="panel-heading">
                            Tìm kiếm sản phẩm
                        </div>
{{--                        <form method="POST" action="{{ route('product.search') }}" ng-submit="search()">--}}
                        <form method="POST" ng-submit="search()">
                            {{ csrf_field() }}
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <label>Tìm kiếm sản phẩm</label>
                                    <div class="input-group">
                                        <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" placeholder="Tìm kiếm..." ng-model="name">

                                        @if ($errors->has('name'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <label>Mức giá</label>
                                    <div class="checkbox">
                                        <select name="price" ng-model="price">
                                            <option value="">Chọn mức giá</option>
                                            <option value="0" @if (old('price') == "0") selected="selected" @endif> 0-100.000 vnđ</option>
                                            <option value="1" @if (old('price') == "1") selected="selected" @endif> 101.000-300.000 vnđ</option>
                                            <option value="2" @if (old('price') == "2") selected="selected" @endif> 301.000-500.000 vnđ</option>
                                            <option value="3" @if (old('price') == "3") selected="selected" @endif> 501.000-800.000 vnđ</option>
                                            <option value="4" @if (old('price') == "4") selected="selected" @endif> 800.000+ vnđ</option>
                                        </select>
                                        @if ($errors->has('price'))
                                            <span class="help-block">
                                            <strong>{{ $errors->first('price') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <label>Xuất xứ</label>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="options1" value="option1">
                                            Mỹ
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="options2" value="option2">
                                            Argentina
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="options3" value="option3">
                                            Chile
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="options4" value="option4">
                                            Khác
                                        </label>
                                    </div>
                                </li>
                            </ul>
                            <div class="panel-footer">
                                <button class="btn btn-primary" type="submit">
                                    <i class="fa fa-search" aria-hidden="true"></i> Tìm kiếm
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="productItem_view col-md-9">
                    <img class="cover" src="{{ asset('public/frontend/img/cover/cover_01.jpg') }}" alt="cover">

                    <div class="row" id="list-product">
                        <?php for($i = 0; $i < 6; $i++){ ?>
                        <div class="item col-md-4 col-sm-6 col-xs-12">
                            <div class="inner">
                                <div class="mask">
                                    <img src="{{ asset('public/frontend/img/product/001.png') }}" alt="ảnh rượu 1">
                                </div>

                                <span class="badge">-30%</span>

                                <span class="productName">Tên sản phẩm rượu</span>
                                <h4 class="productYear">1968</h4>
                                <h3 class="productPrice">1.968.000 vnđ</h3>
                                <br>
                                <!--<a class="btn btn-primary" href="#" role="button">Thử rượu miễn phí</a>-->
                                <a class="btn btn-primary visible-xs" href="{{ url('san-pham/chi-tiet') }}/chi-tiet" target="_self"" role="button">Xem chi tiết</a>
                                <br>
                                <a class="btn btn-primary visible-xs" href="#" role="button">Thêm vào giỏ hàng</a>
                                <br>
                                <a class="btn btn-primary visible-xs" href="#" role="button">Thử rượu miên phí</a>

                                <div class="hover">
                                    <span class="productName">Tên sản phẩm rượu</span>
                                    <h4 class="productYear">1968</h4>
                                    <h3 class="productPrice">1.968.000 vnđ</h3>
                                    <br>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam vel nulla id bibendum. Vestibulum id diam bibendum velit sagittis imperdiet. Fusce in gravida urna.</p>
                                    <br>
                                    <a class="btn btn-primary" href="{{ url('san-pham/chi-tiet') }}/chi-tiet" target="_self"" role="button">Xem chi tiết</a>
                                    <br>
                                    <a class="btn btn-primary" href="#" role="button">Thêm vào giỏ hàng</a>
                                    <br>
                                    <a class="btn btn-primary" href="#" role="button">Thử rượu miên phí</a>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                    <div class="row" ng-if="isEmpty(products)">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <h4>Chúng tôi không tìm thấy sản phẩm của bạn!</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/product.js") }}"></script>
    <script src="{{ asset ("public/frontend/app/controllers/modal.js") }}"></script>
    <script>
        $(window).scroll(function () {
            //if you hard code, then use console
            //.log to determine when you want the
            //nav bar to stick.
            'use strict';
            if ($(window).scrollTop() > 100) {
                $('.main_content').css( 'margin-top' , '280px');
            }
            if ($(window).scrollTop() < 100) {
                $('.main_content').css( 'margin-top' , '50px');
            }
        });
    </script>
@endsection