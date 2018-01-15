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
                    </div>
                </div>
                <div class="product_detail col-md-9 col-sm-12 col-xs-12">
                    <div class="preview col-md-5 col-sm-5 col-xs-12">
                        <a class="preview" href="{{ asset('storage/app') }}/<% detail.image %>">
                            <img src="{{ asset('storage/app') }}/<% detail.image %>" class="w-100" alt="preview">
                        </a>

                    </div>
                    <div class="infomation col-lg-7 col-md-7 col-sm-7 col-xs-12">
                        <h2 class="productName"><% detail.name %></h2>

                        <h2 class="productPrice">
                            <span class="price"><% detail.price | currency:VND:0 | commaToDot | removeUSCurrency  %> vnđ</span>
                        </h2>

                        <div class="info">
                            <table class="table">
                                <tr>
                                    <td>Nồng độ cồn</td>
                                    <td><% detail.concentrations %></td>
                                </tr>
                                <tr>
                                    <td>Dung tích</td>
                                    <td><% detail.capacity %></td>
                                </tr>
                                <tr>
                                    <td>Nguyên liệu</td>
                                    <td><% detail.material %></td>
                                </tr>
                                <tr>
                                    <td>Niên vụ</td>
                                    <td><% detail.year %></td>
                                </tr>
                                <tr>
                                    <td>Nhà sản xuất</td>
                                    <td><% detail.producer %></td>
                                </tr>
                                <tr>
                                    <td>Thể tích</td>
                                    <td><% detail.volume %></td>
                                </tr>
                                <tr>
                                    <td>Xuất xứ</td>
                                    <td><% detail.origin_title %></td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <p ng-bind-html="$sce.trustAsHtml(detail.description)"></p>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        Chia sẻ qua <a href="javascript:void(0);" class="btn btn-primary" role="button"><i class="fa fa-facebook-f" aria-hidden="true"></i> </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <button class="btn btn-primary" type="submit"  ng-click="addToCart(detail.id)">Thêm vào giỏ hàng</button>
                                        <a href="javascript:void(0);" class="btn btn-primary" role="button" ng-click="addToTasting(detail.id)">Đăng ký thử ruọu</a>
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
                                        <p ng-bind-html="$sce.trustAsHtml(detail.content)"></p>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                {{--<div class="carousel carousel-showmanymoveone slide" id="itemslider_1">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="title_mid">
                                                <h3>Sản phẩm liên quan</h3>
                                            </div>
                                        </div>
                                        <div class="slider_controler">
                                            <ul class="list-inline"  ng-repeat="targetProduct in targetProducts">
                                                <li>
                                                    
                                                    <a class="left carousel-control" href="#itemslider_1" data-slide="prev">
                                                        <span class="glyphicon glyphicon-menu-left" aria-hidden="true"><% targetProduct.name %></span>
                                                    </a>
                                                </li>
                                                
                                            </ul>
                                            <a href="{{ url('thuong-hieu') }}/<% detail.category_slug %>" target="_self">
                                                Xem tất cả
                                            </a>
                                        </div>
                                    </div>
                                </div>--}}
                                <form role="form" name="comment" ng-submit="save(detail.id)">
                                    <div role="tabpanel" class="tab-pane" id="comment">
                                        <div class="form-group">
                                            <label for="inputName">Họ tên</label>
                                            <input type="text" class="form-control" id="inputAuthor" placeholder="VD: Nguyễn Văn An" name="author" ng-model="author" ng-required="true">
                                            <span class="help-block" ng-show="comment.author.$error.required">Họ tên không được trống</span>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail">Email</label>
                                            <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" ng-model="email" ng-required="true">
                                            <span class="help-block" ng-show="comment.email.$error.required">Email không được trống</span>
                                            <span class="help-block" ng-show="comment.email.$error.email">Định dạng email không đúng</span>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputRating">Đánh giá của bạn</label>
                                            <div class="rating">
                                                <select name="rating" ng-model="rating">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select>
                                                {{--<span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>
                                                <span><i class="fa fa-star-o"></i></span>--}}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputMessage">Nội dung</label>
                                            <textarea class="form-control" id="inputMessage" placeholder="Viết cho chúng tôi cảm nhận của bạn" rows="4" name="content" ng-model="content"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-primary" type="submit" id="sendComment" ng-disabled="comment.$invalid">Gửi đánh giá</button>
                                        </div>
                                    </div>
                                </form>

                                <div class="comments_posts_list">

                                    <table class="table list-comment">
                                        <div class="media first-comment" ng-repeat="comments in productComments">
                                            <div class="media-left">
                                                <img class="media-object" src="{{ asset('public/frontend/img/users_ava.png') }}" alt="users_ava">
                                            </div>
                                            <div class="media-body">
                                                <h4 class="media-heading"><% comments.author %></h4>
                                                <p ng-bind-html="$sce.trustAsHtml(comments.content)"></p>
                                            </div>
                                        </div>
                                    </table>
                                </div>
                                <div class="btn btn-primary see-more" ng-click="seeMore(detail.id)">Xem thêm ...</div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12" ng-if="productTrademarks">
                        <div class="row">
                            <div class="title_big">
                                <h3>Sản phẩm liên quan</h3>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <div class="carousel carousel-showmanymoveone slide" id="itemslider_1">
                                    <div class="row">
                                        <div class="col-md-6">

                                        </div>
                                        <div class="slider_controler">
                                            <ul class="list-inline">
                                                <li>
                                                    <a class="left carousel-control" href="#itemslider_1" data-slide="prev"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></a>
                                                </li>
                                                <li>
                                                    <a class="right carousel-control" href="#itemslider_1" data-slide="next"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a><strong></strong>
                                                </li>
                                                <li>
                                                    <a href="{{ url('thuong-hieu') }}/<% detail.trademark_slug %>" target="_self">
                                                        Xem tất cả
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="carousel-inner">
                                        <div class="item active" ng-repeat="product in productTrademarks">
                                            <div class="product_view col-xs-12 col-sm-6 col-md-3">
                                                <img src="{{ asset('storage/app') }}/<% product.image %>" class="img-responsive center-block">

                                                <a href="#" class="product_quickView" data-toggle="modal" data-target="#product_quickView" title="Xem nhanh" ng-click="open(product)">
                                                    <i class="fa fa-search"></i>
                                                </a>

                                                <a href="#" class="product_addtoCart" data-toggle="modal" data-target="#product_quickview" title="Thêm vào giỏ hàng">
                                                    <i class="fa fa-cart-plus"></i>
                                                </a>
                                                <a href="{{ url('san-pham/chi-tiet') }}/<% product.slug %>"  target="_self"><h4><% product.name %></h4></a>
                                                <span class="price"><% product.price | currency:VND:0 | commaToDot | removeUSCurrency %> vnđ</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/detail-product.js") }}"></script>
    <script src="{{ asset ("public/frontend/app/controllers/modal.js") }}"></script>
@endsection