@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/store.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="ProductController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="container-fluid">
                <div class="row">
                    <img class="cover" src="{{ asset('public/frontend/img/cover/cover_01.jpg') }}" alt="cover">
                </div>

                <div class="row">
                    <!--<div class="nav_product">
                        <ul class="nav nav-pills nav-justified">
                            <li class="panel-heading">Danh mục sản phẩm</li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-glass" aria-hidden="true"></i> Drink
                                </a>
                                <div class="nav_expand">
                                    abc
                                </div>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-beer" aria-hidden="true"></i> Beer
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-cutlery" aria-hidden="true"></i> Food
                                </a>
                            </li>
                        </ul>
                    </div>-->

                    <div class="nav_product">
                        <ul class="list-inline list-unstyled">
                            <span class="panel-heading">Danh mục sản phẩm</span>
                            <li class="" ng-repeat="type in menuProduct.type">
                                <a href="{{ url('loai-san-pham') }}/<% type.slug %>"  target="_self"><% type.title %></a>
                                <div class="nav_expand">
                                    <div class="left hidden-sm hidden-xs"></div>
                                    <div class="right">
                                        <div class="type" ng-repeat="kind in menuProduct.kind" ng-hide="kind.type_id != type.id">
                                            <label >
                                                <a href="{{ url('dong-san-pham') }}/<% kind.slug %>"  target="_self"><% kind.title %></a>
                                            </label>
                                            <ul class="list-unstyled list-inline">
                                                <li ng-repeat="trademarks in menuProduct.trademarks" ng-hide="trademarks.kind_id != kind.id">
                                                    <a href="{{ url('thuong-hieu') }}/<% trademarks.slug %>" target="_self"><% trademarks.name %></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <!--<div class="nav_product">
                        <ul class="list-unstyled list-inline">
                            <span class="panel-heading">Danh mục sản phẩm</span>
                            <li class="active">
                                <a href="#">
                                    <i class="fa fa-glass" aria-hidden="true"></i> Drink
                                </a>
                                <div class="nav_expand">
                                    <div class="left hidden-sm hidden-xs"></div>
                                    <div class="right">
                                        <?php for($i = 0; $i < 8; $i ++){ ?>
                                        <label>
                                            <a href="javascript:void(0);">
                                                Level ruou cap 2
                                            </a>
                                        </label>

                                        <ul class="list-unstyled list-inline">

                                            <li>
                                                <a href="javascript:void(0);">
                                                    Level ruou cap 3
                                                </a>
                                            </li>

                                        </ul>
                                        <?php } ?>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-beer" aria-hidden="true"></i> Beer
                                </a>
                                <div class="nav_expand">
                                    <div class="left hidden-sm hidden-xs"></div>
                                    <div class="right">
                                        <label>
                                            <a href="javascript:void(0);">
                                                Level ruou cap 2
                                            </a>
                                        </label>

                                        <ul class="list-unstyled list-inline">
                                            <?php for($i = 0; $i < 4; $i ++){ ?>
                                            <li>
                                                <a href="javascript:void(0);">
                                                    Level ruou cap 3
                                                </a>
                                            </li>
                                            <?php } ?>
                                        </ul>

                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-cutlery" aria-hidden="true"></i> Food
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-coffee" aria-hidden="true"></i> Others
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>-->
            </div>

            <div class="row">
                <div class="category col-md-3 col-sm-3 col-xs-12">
                    <!--<div class="panel panel-default">

                        <div class="panel-heading">Danh mục sản phẩm</div>


                        <ul class="list-group">
                            <li class="list-group-item" ng-repeat="type in menuProduct.type">
                                <a href="{{ url('loai-san-pham') }}/<% type.slug %>"  target="_self"><% type.title %></a>
                                <ul class="list-group">
                                    <li class="list-group-item" ng-repeat="kind in menuProduct.kind" ng-hide="kind.type_id != type.id">
                                        <a href="{{ url('dong-san-pham') }}/<% kind.slug %>"  target="_self"><% kind.title %></a>
                                        <ul class="list-group">
                                            <li class="list-group-item" ng-repeat="trademarks in menuProduct.trademarks" ng-hide="trademarks.kind_id != kind.id">
                                                <a href="{{ url('thuong-hieu') }}/<% trademarks.slug %>" target="_self"><% trademarks.name %></a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>-->

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
                                        <select name="origin" ng-model="origin">
                                            <option value="">Select</option>
                                            <option ng-repeat="origin in origin" value="<% origin.id %>" > <% origin.name %> </option>
                                        </select>
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
                    {{--<img class="cover" src="{{ asset('public/frontend/img/cover/cover_01.jpg') }}" alt="cover">--}}

                    <div class="row" id="list-product">
                        <div class="item col-md-4 col-sm-6 col-xs-12" ng-repeat="product in products">
                            <div class="inner">
                                <div class="mask">
                                    <img src="{{ asset('storage/app') }}/<% product.image %>" alt="<% product.slug %>">
                                </div>

                                <span class="badge">- <% product.product_percent %>%</span>

                                <span class="productName"><% product.name %></span>
                                <h4 class="productYear"><% product.year %></h4>
                                <h3 class="productPrice"><% product.price %> vnđ</h3>
                                <br>
                                <a class="btn btn-primary" href="#" role="button">Thử rượu miễn phí</a>

                                <div class="hover">
                                    <span class="productName"><% product.name %></span>
                                    <h4 class="productYear"><% product.year %></h4>
                                    <h3 class="productPrice"><% product.price %> vnđ</h3>
                                    <br>
                                    <p ng-bind-html="$sce.trustAsHtml(product.description)"></p>
                                    <br>
                                    <a class="btn btn-primary" href="#" role="button" ng-click="addToCart(product.id)">Thêm vào giỏ hàng</a>
                                    <br>
                                    <a class="btn btn-primary" href="{{ url('/san-pham/chi-tiet') }}/<% product.slug %>" role="button"  target="_self" >Xem chi tiết</a>
                                    <br>
                                    <a class="btn btn-primary" href="#" role="button">Thử rượu miên phí</a>
                                </div>
                            </div>
                        </div>
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