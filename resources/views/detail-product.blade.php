@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/blog.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="DetailProductController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="row">
                <div class="catelogy col-md-3 col-sm-12 col-xs-12">
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
                <div class="product_detail col-md-9 col-sm-12 col-xs-12">
                    <div class="preview col-md-5 col-sm-5 col-xs-12">
                        <a class="preview" href="img/SP1.jpg">
                            <img src="{{ asset('storage/app') }}/<% detail.image %>" class="w-100" alt="preview">
                        </a>
                        <ul class="list-inline other">
                            <li>
                                <img class="w-thumbnail" src="{{ asset('storage/app') }}/<% detail.image %>" alt="preview">
                            </li>
                            <li>
                                <img class="w-thumbnail" src="{{ asset('storage/app') }}/<% detail.image %>" alt="preview">
                            </li>
                        </ul>
                    </div>
                    <div class="infomation col-lg-7 col-md-7 col-sm-7 col-xs-12">
                        <h2><% detail.name %></h2>

                        <h3 class="price"><% detail.price | currency:VND:0 | commaToDot | removeUSCurrency %> vnđ</h3>

                        <div class="info">
                            <table class="table">
                                <tr>
                                    <td>Công dụng</td>
                                    <td><% detail.effect %></td>
                                </tr>
                                <tr>
                                    <td>Trọng lượng</td>
                                    <td><% detail.weight %></td>
                                </tr>
                                <tr>
                                    <td>Nhà sản xuất</td>
                                    <td><% detail.producer %></td>
                                </tr>
                            </table>

                            <form class="form-inline">
                                {{--<div class="form-group">--}}
                                    {{--<label for="inputQuanlity">Số lượng</label>--}}
                                    {{--<input type="number" class="form-control" id="inputQuanlity">--}}
                                {{--</div>--}}
                                <a href="#" class="product_addtoCart" data-toggle="modal" data-target="#product_quickview" title="Thêm vào giỏ hàng" ng-click="addToCart(detail.id)">Thêm vào giỏ hàng</a>
                                <button type="submit" class="btn btn-primary"><i class="fa fa-heart-o"></i></button>
                                <br>
                                <br>
                                Chia sẻ: <a href="#" target="_blank" id="link-facebook"><i class="fa fa-2x fa-facebook-official"></i></a> <a href="#" target="_blank" id="link-google-plus"><i class="fa fa-2x fa-google-plus-official"></i></a>
                            </form>

                        </div>
                    </div>
                    <div class="detail_info col-md-12 col-sm-12 col-xs-12">
                        <div>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#detail" aria-controls="detail" role="tab" data-toggle="tab">Thông tin chi tiết</a></li>
                                <li role="presentation"><a href="#manual" aria-controls="manual" role="tab" data-toggle="tab">Hướng dẫn sử dụng</a></li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="detail">
                                    <p ng-bind-html="$sce.trustAsHtml(detail.content)"></p>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="manual">
                                    <p ng-bind-html="$sce.trustAsHtml(detail.guide)"></p>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="carousel carousel-showmanymoveone slide" id="itemslider_1">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="title_mid">
                                                <h3>Sản phẩm liên quan</h3>
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
                                                    <a href="{{ url('danh-muc') }}/<% detail.category_slug %>" target="_self">
                                                        Xem tất cả
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="carousel-inner">
                                        <div class="item active" ng-repeat="product in targetProducts" ng-if="product.id != detail.id">
                                            <div class="product_view col-xs-12 col-sm-6 col-md-3">
                                                <img src="{{ asset('storage/app') }}/<% product.image %>" class="img-responsive center-block">
                                                <a href="#" class="product_quickView" data-toggle="modal" data-target="#product_quickView" title="Xem nhanh" ng-click="open(product)"><i class="fa fa-search"></i></a>
                                                <a href="#" class="product_addtoCart" data-toggle="modal" data-target="#product_quickview" title="Thêm vào giỏ hàng"><i class="fa fa-cart-plus"></i></a>
                                                <a href="#"><h4><% product.name %></h4></a>
                                                <span class="price"><% product.price | currency:VND:0 | commaToDot | removeUSCurrency %> vnđ</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="title_mid">
                                    <h3>Đánh giá sản phẩm</h3>
                                </div>
                            </div>
                        </div>
                        <form>
                            <div class="row">
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="form-group">
                                        <label for="inputName">Họ tên</label>
                                        <input type="text" class="form-control" id="inputName" placeholder="VD: Nguyễn Văn An">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail">Email</label>
                                        <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail">Đánh giá của bạn</label>
                                        <div class="rating">
                                            <span><i class="fa fa-star-o"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTitle">Tiêu đề</label>
                                        <input type="text" class="form-control" id="inputTitle" placeholder="Tiêu đề">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputMessage">Nội dung</label>
                                        <textarea class="form-control" id="inputMessage" placeholder="Viết cho chúng tôi cảm nhận của bạn" rows="4"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <button class="btn btn-primary" type="submit" id="sendComment">Gửi đánh giá</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/detail-product.js") }}"></script>
    <script src="{{ asset ("public/frontend/app/controllers/modal.js") }}"></script>
@endsection