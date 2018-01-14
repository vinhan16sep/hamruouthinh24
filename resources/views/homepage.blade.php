@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/style_slide_product.css")}}" rel="stylesheet" type="text/css" />
    <link href="{{ asset("public/frontend/css/homepage.css")}}" rel="stylesheet" type="text/css" />

    <section class="big_cover">
        <div class="content">
            <h3>save water</h3>
            <h1>drink wine</h1>
            <br>
            <a class="btn btn-primary" href="#scroll_point" role="button">Khám phá ngay</a>
        </div>
    </section>
    <section class="main_content" ng-controller="HomepageController" id="main_content">
        <span id="scroll_point"></span>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="row">
                        <div class="col-md-8 col-sm-8 col-xs-12">
                            <img src="{{ asset('public/frontend/img/blog_01.jpg') }}" alt="ảnh minh họa 1">
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <a href="javascript:void(0);" class="link-primary">
                                <h1>Sed a lacus vel eros mollis ullamcorper id ac sapien</h1>
                            </a>
                            <article class="description">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam vel nulla id bibendum. Vestibulum id diam bibendum velit sagittis imperdiet. Fusce in gravida urna. Maecenas lacus justo, iaculis eget velit id, fermentum tristique quam. Fusce viverra, nulla vitae pulvinar tincidunt, ex nibh dignissim diam, quis pharetra nunc nisl eget orci.</p>
                            </article>

                            <a class="btn btn-primary" href="#" role="button">Khám phá ngay</a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="row">
                        <div class="col-md-8 col-sm-8 col-xs-12">
                            <img src="{{ asset('public/frontend/img/blog_02.jpg') }}" alt="ảnh minh họa 1">
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <a href="javascript:void(0);" class="link-primary">
                                <h1>Sed a lacus vel eros mollis ullamcorper id ac sapien</h1>
                            </a>
                            <article class="description">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam vel nulla id bibendum. Vestibulum id diam bibendum velit sagittis imperdiet. Fusce in gravida urna. Maecenas lacus justo, iaculis eget velit id, fermentum tristique quam. Fusce viverra, nulla vitae pulvinar tincidunt, ex nibh dignissim diam, quis pharetra nunc nisl eget orci.</p>
                            </article>

                            <a class="btn btn-primary" href="#" role="button">Khám phá ngay</a>
                        </div>
                    </div>
                </div>
                ...
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

        <section class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-12">
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

                <div class="col-md-9 col-sm-9 col-xs-12">
                    <div class="title_big">
                        Sản phẩm khuyến mãi
                    </div>

                    <div class="row">
                        <div class="item col-md-4 col-sm-6 col-xs-12" ng-repeat="discount in discounts">
                            <div class="inner">
                                <div class="mask">
                                    <img src="{{ asset('storage/app/') }}/<% discount.image %>" alt="<% discount.slug %>">
                                </div>

                                <span class="badge">- <% discount.discount_percent %>%</span>

                                <span class="productName"><% discount.name %></span>
                                <h4 class="productYear"><% discount.year %></h4>
                                <h3 class="productPrice"><% discount.price | currency:VND:0 | commaToDot | removeUSCurrency  %> vnđ</h3>
                                <br>
                                <a class="btn btn-primary" href="#" role="button">Thử rượu miễn phí</a>

                                <div class="hover">
                                    <span class="productName"><% discount.name %></span>
                                    <h4 class="productYear"><% discount.year %></h4>
                                    <h3 class="productPrice"><% discount.price | currency:VND:0 | commaToDot | removeUSCurrency  %> vnđ</h3>
                                    <br>
                                    <p ng-bind-html="$sce.trustAsHtml(discount.description)"></p>
                                    <br>
                                    <a class="btn btn-primary" href="#" role="button" ng-click="addToCart(discount.id)">Thêm vào giỏ hàng</a>
                                    <br>
                                    <a class="btn btn-primary" href="{{ url('/san-pham/chi-tiet') }}/<% discount.slug %>" role="button"  target="_self" >Xem chi tiết</a>
                                    <br>
                                    <a class="btn btn-primary" href="#" role="button" ng-click="addToTasting(discount.id)">Thử rượu miên phí</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section class="container-fluid" id="tasting_wine">
            <div class="row">
                <div class="left col-md-4 col-sm-6 col-xs-12 col-md-offset-1 col-sm-offset-1">
                    <div class="title_mid">
                        Sản phẩm khuyến mãi
                    </div>

                    <h2>Maecenas pulvinar tristique malesuada</h2>
                    <p>Vivamus ac tempor quam. Maecenas pulvinar tristique malesuada. Donec euismod nibh et dapibus tempor. Nullam elit nulla, rutrum eget eros sollicitudin, ullamcorper ultrices orci. Suspendisse potenti. Ut porta bibendum nibh eu viverra. Sed vel magna ac ligula finibus fermentum fringilla eu lectus. Sed elit ante, ornare nec dui at, molestie congue arcu. Nam at imperdiet neque, non tempus libero. Praesent dolor odio, mattis vulputate est ut, vulputate sollicitudin metus. Nulla id metus turpis. Phasellus non diam nisi. Duis vitae felis et magna elementum dictum. Pellentesque in enim fringilla, ullamcorper lacus et, imperdiet erat.</p>

                    <a class="btn btn-primary" href="#" role="button">Đăng ký thử ngay bây giờ</a>
                </div>
            </div>
        </section>

        <section class="container-fluid" id="news">
            <div class="container">
                <div class="title_big">
                    Tin tức
                </div>
                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-12" ng-repeat="new in news">
                        <div class="inner">
                            <img src="{{ asset('storage/app') }}/<% new.image %>" alt="ảnh mình họa bài viết">
                            <a href="#">
                                <h3><% new.title %></h3>
                            </a>
                            <br>
                            <p ng-bind-html="$sce.trustAsHtml(new.description)"></p>
                            <br>
                            <a href="{{ url('/tin-tuc') }}/<% new.slug %>" class="btn btn-primary" target="_self" >Xem thêm <i class="fa fa-angle-double-right" aria-hidden="false"></i> </a>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <section class="container-fluid" id="about">
            <div class="row" ng-repeat="introduce in introduce">

                <div class="right col-md-6 col-sm-6 col-xs-12 col-md-offset-6 col-sm-offset-6" ng-if="introduce.slug == 've-chung-toi' ">
                    <div class="left hidden-xs"></div>
                    <div class="title_big">
                        Về chúng tôi
                    </div>
                    <p ng-bind-html="$sce.trustAsHtml(introduce.content)"></p>
                    

                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <i class="fa fa-3x fa-phone" aria-hidden="false"></i>
                            <br>
                            <h4>Hỗ trợ qua điện thoại</h4>
                            <p>Suspendisse potenti. Cras molestie mi sed iaculis varius. Maecenas fermentum semper sagittis. Sed eu mattis tellus. Mauris dolor ligula, pellentesque id vestibulum nec, consectetur sed sem. Aenean at ante enim. Quisque dapibus ligula ut erat laoreet aliquet. Pellentesque dictum magna ante, venenatis scelerisque risus pretium eget. Nullam et orci vitae felis rutrum tempor. Vestibulum id maximus lacus.</p>
                        </div>

                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <i class="fa fa-3x fa-truck" aria-hidden="false"></i>
                            <br>
                            <h4>Miễn phí giao hàng</h4>
                            <p>Suspendisse potenti. Cras molestie mi sed iaculis varius. Maecenas fermentum semper sagittis. Sed eu mattis tellus. Mauris dolor ligula, pellentesque id vestibulum nec, consectetur sed sem. Aenean at ante enim. Quisque dapibus ligula ut erat laoreet aliquet. Pellentesque dictum magna ante, venenatis scelerisque risus pretium eget. Nullam et orci vitae felis rutrum tempor. Vestibulum id maximus lacus.</p>
                        </div>

                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <i class="fa fa-3x fa-user-o" aria-hidden="false"></i>
                            <br>
                            <h4>Hỗ trợ người mua hàng</h4>
                            <p>Suspendisse potenti. Cras molestie mi sed iaculis varius. Maecenas fermentum semper sagittis. Sed eu mattis tellus. Mauris dolor ligula, pellentesque id vestibulum nec, consectetur sed sem. Aenean at ante enim. Quisque dapibus ligula ut erat laoreet aliquet. Pellentesque dictum magna ante, venenatis scelerisque risus pretium eget. Nullam et orci vitae felis rutrum tempor. Vestibulum id maximus lacus.</p>
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
