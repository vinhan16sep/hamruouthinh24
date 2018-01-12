@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/store.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="DetailProductController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="row">
                <div class="catelogy col-md-3 col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading">Danh mục sản phẩm</div>

                        <!-- List group -->
                        <ul class="list-group">
                            <li class="list-group-item" ng-repeat="type in menuProduct.type">
                                <a href="{{ url('loai-san-pham') }}/<% type.slug %>" target="_self">
                                    <% type.title %>
                                </a>
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
                            </li>
                            <li class="list-group-item">
                                <a href="javascript:void(0);">Bánh kẹo</a>
                            </li>
                            <li class="list-group-item">
                                <a href="javascript:void(0);">Sản phẩm khác</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="product_detail col-md-9 col-sm-12 col-xs-12">
                    <div class="preview col-md-5 col-sm-5 col-xs-12">
                        <a class="preview" href="{{ asset('public/frontend/img/product/001.png') }}">
                            <img src="{{ asset('public/frontend/img/product/001.png') }}" class="w-100" alt="preview">
                        </a>

                    </div>
                    <div class="infomation col-lg-7 col-md-7 col-sm-7 col-xs-12">
                        <h2 class="productName">Vang đỏ ST Henri Shiaz</h2>

                        <h2 class="productPrice">1.000.000 vnđ</h2>

                        <div class="info">
                            <table class="table">
                                <tr>
                                    <td>Nồng độ cồn</td>
                                    <td>13,5%</td>
                                </tr>
                                <tr>
                                    <td>Dung tích</td>
                                    <td>750ml/ chai, 6 chai/ thùng</td>
                                </tr>
                                <tr>
                                    <td>Nguyên liệu</td>
                                    <td>Nho 100%</td>
                                </tr>
                                <tr>
                                    <td>Niên vụ</td>
                                    <td>1968</td>
                                </tr>
                                <tr>
                                    <td>Nhà sản xuất</td>
                                    <td>ST Henri Shiaz</td>
                                </tr>
                                <tr>
                                    <td>Thể tích</td>
                                    <td>750ml/ chai</td>
                                </tr>
                                <tr>
                                    <td>Xuất xứ</td>
                                    <td>Mỹ</td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        Quisque interdum rhoncus ullamcorper. Maecenas velit odio, maximus nec pulvinar in, fringilla et augue. Nunc dictum mauris eu dapibus congue. Fusce rutrum eget massa nec sagittis. Proin quam nisl, ornare vitae nisl sed, egestas accumsan purus. Aliquam diam turpis, euismod sit amet luctus eu, congue a velit. Pellentesque commodo odio tincidunt, finibus ex eget, maximus eros. Suspendisse eleifend dolor vitae suscipit blandit. Etiam ullamcorper dolor vitae ante maximus, ac rhoncus nulla vehicula. Duis quis libero lacus.
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        Chia sẻ qua <a href="javascript:void(0);" class="btn btn-primary" role="button"><i class="fa fa-facebook-f" aria-hidden="true"></i> </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <button class="btn btn-primary" type="submit">Thêm vào giỏ hàng</button>
                                        <a href="javascript:void(0);" class="btn btn-primary" role="button">Đăng ký thử ruọu</a>
                                    </td>
                                </tr>

                            </table>

                        </div>
                    </div>
                    <div class="detail_info col-md-12 col-sm-12 col-xs-12">
                        <div>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#detail" aria-controls="detail" role="tab" data-toggle="tab">Thông tin chi tiết</a></li>
                                <li role="presentation"><a href="#comment" aria-controls="comment" role="tab" data-toggle="tab">Đánh giá sản phẩm</a></li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="detail">
                                    <article>
                                        <p>Quisque interdum rhoncus ullamcorper. Maecenas velit odio, maximus nec pulvinar in, fringilla et augue. Nunc dictum mauris eu dapibus congue. Fusce rutrum eget massa nec sagittis. Proin quam nisl, ornare vitae nisl sed, egestas accumsan purus. Aliquam diam turpis, euismod sit amet luctus eu, congue a velit. Pellentesque commodo odio tincidunt, finibus ex eget, maximus eros. Suspendisse eleifend dolor vitae suscipit blandit. Etiam ullamcorper dolor vitae ante maximus, ac rhoncus nulla vehicula. Duis quis libero lacus.</p>
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
                                                    <a href="{{ url('thuong-hieu') }}/<% detail.category_slug %>" target="_self">
                                                        Xem tất cả
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                        <p>Fusce ultricies ligula et blandit tempor. Nam eu lectus orci. Phasellus a diam varius, gravida libero vitae, tempor velit. Mauris ultrices rhoncus risus, at pharetra massa dapibus ut. Aenean convallis quam et ornare cursus. Mauris tempor vestibulum egestas. Ut pretium libero in lacus finibus malesuada. Donec sit amet lobortis erat. Phasellus ut elementum lacus. Fusce aliquam ante ut quam pharetra volutpat. Proin nulla ex, congue at egestas eget, pharetra id odio.</p>

                                        <img src="{{ asset('public/frontend/img/cover/cover_03.jpg') }}" alt="preview">

                                        <p>Nullam quis dui nec sapien eleifend euismod. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam varius urna quis enim bibendum feugiat. Fusce lacus eros, pretium id consequat eget, suscipit ut nulla. Proin eu magna luctus, lacinia risus rhoncus, convallis enim. Pellentesque molestie ultricies orci vel tempor. Praesent orci urna, porttitor ut semper in, aliquam in enim. Sed mattis libero at ex rhoncus, sit amet commodo metus ultrices. Nam eleifend, justo et dapibus pharetra, odio orci bibendum ante, eu mollis orci dui nec magna. Nulla in semper nunc. Curabitur vel porttitor orci, in laoreet lacus. Maecenas consequat, lacus ac aliquet efficitur, est lectus placerat nulla, at suscipit felis orci vel urna. Nunc sollicitudin rhoncus pharetra. Nunc semper ipsum vitae mauris cursus, vel vehicula nunc consectetur. Maecenas id tempor metus.</p>
                                    </article>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="comment">
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
                                    <div class="form-group">
                                        <button class="btn btn-primary" type="submit" id="sendComment">Gửi đánh giá</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    {{--<div class="col-md-12 col-sm-12 col-xs-12">--}}
                        {{--<div class="row">--}}
                            {{--<div class="title_big">--}}
                                {{--<h3>Sản phẩm liên quan</h3>--}}
                            {{--</div>--}}
                            {{--<div class="col-xs-12 col-sm-12 col-md-12">--}}
                                {{--<div class="carousel carousel-showmanymoveone slide" id="itemslider_1">--}}
                                    {{--<div class="row">--}}
                                        {{--<div class="col-md-6">--}}

                                        {{--</div>--}}
                                        {{--<div class="slider_controler">--}}
                                            {{--<ul class="list-inline">--}}
                                                {{--<li>--}}
                                                    {{--<a class="left carousel-control" href="#itemslider_1" data-slide="prev"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></a>--}}
                                                {{--</li>--}}
                                                {{--<li>--}}
                                                    {{--<a class="right carousel-control" href="#itemslider_1" data-slide="next"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a><strong></strong>--}}
                                                {{--</li>--}}
                                                {{--<li>--}}
                                                    {{--<a href="{{ url('danh-muc') }}/<% detail.category_slug %>" target="_self">--}}
                                                        {{--Xem tất cả--}}
                                                    {{--</a>--}}
                                                {{--</li>--}}
                                            {{--</ul>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}

                                    {{--<div class="carousel-inner">--}}
                                        {{--<div class="item active" ng-repeat="product in targetProducts" ng-if="product.id != detail.id">--}}
                                            {{--<div class="product_view col-xs-12 col-sm-6 col-md-3">--}}
                                                {{--<img src="{{ asset('storage/app') }}/<% product.image %>" class="img-responsive center-block">--}}
                                                {{--<a href="#" class="product_quickView" data-toggle="modal" data-target="#product_quickView" title="Xem nhanh" ng-click="open(product)"><i class="fa fa-search"></i></a>--}}
                                                {{--<a href="#" class="product_addtoCart" data-toggle="modal" data-target="#product_quickview" title="Thêm vào giỏ hàng"><i class="fa fa-cart-plus"></i></a>--}}
                                                {{--<a href="#"><h4><% product.name %></h4></a>--}}
                                                {{--<span class="price"><% product.price | currency:VND:0 | commaToDot | removeUSCurrency %> vnđ</span>--}}
                                            {{--</div>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                    {{--</div>--}}

                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/detail-product.js") }}"></script>
    <script src="{{ asset ("public/frontend/app/controllers/modal.js") }}"></script>
@endsection