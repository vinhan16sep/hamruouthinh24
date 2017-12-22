@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/style_slide_product.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="HomepageController">
        <!-- InstanceBeginEditable name="content" -->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            {{--<ol class="carousel-indicators">--}}
                {{--<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>--}}
                {{--<li data-target="#carousel-example-generic" data-slide-to="1"></li>--}}
                {{--<li data-target="#carousel-example-generic" data-slide-to="2"></li>--}}
            {{--</ol>--}}

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    {{ HTML::image('public/frontend/img/slide_1.jpg') }}
                    <div class="carousel-caption">
                        ...
                    </div>
                </div>
                <div class="item">
                    {{ HTML::image('public/frontend/img/slide_2.jpg') }}
                    <div class="carousel-caption">
                        ...
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="banner row">
            <div class="item col-md-6 col-sm-6 col-xs-12">
                <a href="javascript:void(0)">
                    {{ HTML::image('public/frontend/img/banner_1.jpg') }}
                </a>
            </div>
            <div class="item col-md-6 col-sm-6 col-xs-12">
                <a href="javascript:void(0)">
                    {{ HTML::image('public/frontend/img/banner_2.jpg') }}
                </a>
            </div>
        </div>

        <section class="container">
            <div class="row">
                <div class="title_big">
                    Sản phẩm khuyến mãi
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="carousel carousel-showmanymoveone slide" id="itemslider_KM">
                            <div class="slider_controler">
                                <ul class="list-inline">
                                    {{--<li>--}}
                                        {{--<a class="left carousel-control" href="#itemslider_KM" data-slide="prev"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></a>--}}
                                    {{--</li>--}}
                                    {{--<li>--}}
                                        {{--<a class="right carousel-control" href="#itemslider_KM" data-slide="next"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a><strong></strong>--}}
                                    {{--</li>--}}
                                    <li>
                                        <a href="#">Xem tất cả</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="carousel-inner">
                                <div class="item" ng-repeat="discount in discounts" active-on-first-four-items>
                                    <div class="product_view col-xs-12 col-sm-6 col-md-3">
                                        <a href="#"><img src="{{ asset('storage/app') }}/<% discount.image %>" class="img-responsive center-block"></a>
                                        <a href="#" class="product_quickView" data-toggle="modal" data-target="#product_quickView" title="Xem nhanh" ng-click="open(discount)"><i class="fa fa-search"></i></a>
                                        <a href="#" class="product_addtoCart" data-toggle="modal" data-target="#product_quickview" title="Thêm vào giỏ hàng" ng-click="addToCart(discount.id)"><i class="fa fa-cart-plus"></i></a>
                                        <a href="{{ url('san-pham/chi-tiet') }}/<% discount.slug %>" target="_self"><h4><% discount.name %></h4></a>
                                        <span class="price"><% discount.discount_price | currency:VND:0 | commaToDot | removeUSCurrency  %> vnđ</span> <span class="price_old"><strong><% discount.price | currency:VND:0 | commaToDot | removeUSCurrency  %> vnđ</strong></span>
                                        <span class="badge_KM">-<% discount.discount_percent %>%</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="catelogy col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Danh sách sản phẩm
                            </div>

                            <ul class="list-group">
                                <li class="list-group-item" ng-repeat="trademark in menuProduct.trademarks">
                                    <a href="{{ url('thuong-hieu') }}/<% trademark.slug %>" target="_self">
                                        <% trademark.name %>
                                    </a>
                                    <ul class="list-group">
                                        <li class="list-group-item" ng-repeat="category in menuProduct.categories" ng-hide="category.trademark_id != trademark.id">
                                            <a href="{{ url('danh-muc') }}/<% category.slug %>" target="_self">
                                                <% category.name %>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="productItem_view col-md-9">
                        <section ng-repeat="trademark in menuProduct.trademarks">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12">
                                    <div class="carousel carousel-showmanymoveone slide" id="itemslider_1">
                                        <div class="col-md-6">
                                            <div class="title_mid">
                                                <h3><% trademark.name %></h3>
                                            </div>
                                        </div>
                                        <div class="slider_controler">
                                            <ul class="list-inline">
                                                {{--<li>--}}
                                                    {{--<a class="left carousel-control" href="#itemslider_1" data-slide="prev"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></a>--}}
                                                {{--</li>--}}
                                                {{--<li>--}}
                                                    {{--<a class="right carousel-control" href="#itemslider_1" data-slide="next"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a><strong></strong>--}}
                                                {{--</li>--}}
                                                <li>
                                                    <a href="{{ url('thuong-hieu') }}/<% trademark.slug %>" target="_self">
                                                        Xem tất cả
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="carousel-inner">
                                            <div class="item active" ng-repeat="product in products" ng-hide="product.trademark_id != trademark.id">
                                                <div class="product_view col-xs-12 col-sm-6 col-md-3">
                                                    <a href="#"><img src="{{ asset('storage/app') }}/<% product.image %>" class="img-responsive center-block"></a>
                                                    <a href="#" class="product_quickView" data-toggle="modal" data-target="#product_quickView" title="Xem nhanh" ng-click="open(product)"><i class="fa fa-search"></i></a>
                                                    <a href="#" class="product_addtoCart" data-toggle="modal" data-target="#product_quickview" title="Thêm vào giỏ hàng" ng-click="addToCart(product.id)"><i class="fa fa-cart-plus"></i></a>
                                                    <a href="{{ url('san-pham/chi-tiet') }}/<% product.slug %>" target="_self"><h4><% product.name %></h4></a>
                                                    <span class="price"><% product.price | currency:VND:0 | commaToDot | removeUSCurrency %> vnđ</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </div>
                </div>
                <div class="row">
                    <div class="title_big">
                        Blog Tư vấn
                    </div>
                    <div class="row">
                        <div class="media col-md-6 col-sm-6 col-xs-12" ng-repeat="advise in latestAdvises">
                            <div class="media-left media-middle">
                                <a href="#">
                                    <img src="{{ asset('storage/app') }}/<% advise.image %>" class="media-object" alt="...">
                                </a>
                            </div>
                            <div class="media-body">
                                <a href="javascript:void(0);">
                                    <h3 class="media-heading"><% advise.title %></h3>
                                </a>
                                <p><% advise.description %></p>
                                <a href="{{ url('tu-van') }}/<% advise.slug %>" target="_self">Xem thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="container-fluid profit">
            <div class="container">
                <div class="row">
                    <div class="media col-md-4 col-sm-6 col-xs-12">
                        <div class="media-left">
                            <i class="fa fa-3x fa-check-square-o"></i>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Bài viết tư vấn chuyên gia về dưỡng ẩm da</h4>
                            <p>Integer faucibus consequat quam, et viverra lorem eleifend et.</p>
                        </div>
                    </div>
                    <div class="media col-md-4 col-sm-6 col-xs-12">
                        <div class="media-left">
                            <i class="fa fa-3x fa-phone"></i>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Bài viết tư vấn chuyên gia về dưỡng ẩm da</h4>
                            <p>Etiam ut luctus ipsum. Proin efficitur odio ac augue laoreet, vel feugiat sapien ornare.</p>
                        </div>
                    </div>
                    <div class="media col-md-4 col-sm-6 col-xs-12">
                        <div class="media-left">
                            <i class="fa fa-3x fa-heart-o"></i>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Bài viết tư vấn chuyên gia về dưỡng ẩm da</h4>
                            <p>Integer faucibus consequat quam, et viverra lorem eleifend et.</p>
                        </div>
                    </div>
                    <div class="media col-md-4 col-sm-6 col-xs-12">
                        <div class="media-left">
                            <i class="fa fa-3x fa-comments-o"></i>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Bài viết tư vấn chuyên gia về dưỡng ẩm da</h4>
                            <p>Integer faucibus ac augue laoreet, vel feugiat sapien ornare.</p>
                        </div>
                    </div>
                    <div class="media col-md-4 col-sm-6 col-xs-12">
                        <div class="media-left">
                            <i class="fa fa-3x fa-home"></i>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Bài viết tư vấn chuyên gia về dưỡng ẩm da</h4>
                            <p>Integer faucibus consequat efficitur odio ac augue laoreet, vel feugiat sapien ornare.</p>
                        </div>
                    </div>
                    <div class="media col-md-4 col-sm-6 col-xs-12">
                        <div class="media-left">
                            <i class="fa fa-3x fa-credit-card"></i>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Bài viết tư vấn chuyên gia về dưỡng ẩm da</h4>
                            <p>Integer faucibus consequat vel feugiat sapien ornare.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/homepage.js") }}"></script>
    <script src="{{ asset ("public/frontend/app/controllers/modal.js") }}"></script>
@endsection
