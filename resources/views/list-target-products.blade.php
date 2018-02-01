@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/store.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="ProductController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="row">
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
                <div class="catelogy col-md-3">
                    
                    <div class="panel panel-default filter">
                        <div class="panel-heading">
                            Tìm kiếm sản phẩm
                        </div>
                        {{--                        <form method="POST" action="{{ route('product.search') }}" ng-submit="search()">--}}
                        <form method="POST" ng-submit="searchTarget()">
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
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">Tìm kiếm</button>
                            </span>
                        </form>
                    </div>
                </div>
                <div class="productItem_view col-md-9">
                    <img class="cover" src="{{ asset('storage/app') }}/<% coverImage %>" alt="cover" ng-if="coverImage">
                    <img class="cover" src="{{ asset('public/frontend/img/trademark_cover.jpg') }}" alt="cover" ng-if="!coverImage && currentTarget == 'thuong-hieu'">
                    <img class="cover" src="{{ asset('public/frontend/img/category_cover.jpg') }}" alt="cover" ng-if="!coverImage && currentTarget == 'danh-muc'">
                    <ol class="breadcrumb">
                        <li><a href="#">Trang chủ</a></li>
                        <li class="active">Sản phẩm</li>
                    </ol>

                    <div class="row">
                        <div class="product_view col-md-4 col-sm-6 col-xs-12" ng-repeat="product in targetProducts">
                            <a href="#"><img src="{{ asset('storage/app') }}/<% product.image[0] %>" class="img-responsive center-block"></a>
                            <a href="" class="product_quickView" data-toggle="modal" data-target="#product_quickView" title="Xem nhanh" ng-click="openTarget(product)"><i class="fa fa-search"></i></a>
                            <a href="#" class="product_addtoCart" data-toggle="modal" data-target="#product_quickview" title="Thêm vào giỏ hàng" ng-click="addToCart(product.id)"><i class="fa fa-cart-plus"></i></a>
                            <a href="{{ url('san-pham/chi-tiet') }}/<% product.slug %>" target="_self"><h4><% product.name %></h4></a>
                            <span class="price"><% product.price | currency:VND:0 | commaToDot | removeUSCurrency  %> vnđ</span>
                        </div>
                    </div>
                    <div class="row" ng-if="isEmpty(targetProducts)">
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
@endsection