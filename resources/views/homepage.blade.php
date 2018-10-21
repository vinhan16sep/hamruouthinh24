@extends('layouts.frontend-template')
@section('content')
<section id="homepage">
    <div class="big_cover">
        <div class="row">
            <div class="left col-md-3 hidden-xs">
                <ul>
                    <?php foreach ($menuProduct['type'] as $key => $value): ?>
                        <li>
                            <a href="">
                                <h3><?php echo $value->title ?><span class="pull-right"><i class="fa fa-caret-right" aria-hidden="false"></i></span> </h3>
                            </a>
                            <ul>
                                <?php foreach ($menuProduct['kind'] as $k => $val): ?>
                                    <?php if ($val->type_id == $value->id): ?>
                                        <li>
                                            <a href="{{ url('dong-san-pham') }}/<?php echo $val->slug ?>"  target="_self">
                                                <h3><?php echo $val->title ?><span class="pull-right"><i class="fa fa-caret-right" aria-hidden="false"></i></span> </h3>
                                            </a>
                                            <ul class="list-unstyled list-inline">
                                                <?php foreach ($menuProduct['trademarks'] as $ks => $vals): ?>
                                                    <?php if ($vals->kind_id == $val->id): ?>
                                                        <li >
                                                            <a href="{{ url('thuong-hieu') }}/<?php echo $vals->slug ?>" target="_self"><?php echo $vals->name ?></a>
                                                        </li>
                                                    <?php endif ?>
                                                <?php endforeach ?>
                                            </ul>
                                        </li>
                                    <?php endif ?>
                                <?php endforeach ?>
                            </ul>
                            <div class="nav_expand">
                                <div class="right">
                                </div>
                            </div>
                        </li>
                    <?php endforeach ?>
                </ul>
            </div>
            <div class="right col-xs-12 col-md-9">
                <div id="homepageSlider" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox" style="width: 100%;height: 100%;" id="banner">

                        <?php foreach (json_decode($banner->image) as $key => $value): ?>
                            <div class="item <?php echo ($key == 0)? ' active' : ''; ?>" style="width: 100%;height: 100%;">
                                {{ HTML::image('storage/app/banner/' . $value) }}
                                <div class="carousel-caption">
                                    ...
                                </div>
                            </div>
                        <?php endforeach ?>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#homepageSlider" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#homepageSlider" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="main_content" ng-controller="HomepageController" id="main_content">
        <span id="scroll_point"></span>
        <div class="container product_list">
            <div class="title_big">
                Sản phẩm đặc biệt
            </div>

            <div class="row">
                <div class="item col-md-3 col-sm-6 col-xs-12" ng-repeat="special in specials">
                    <div class="inner">
                        <div class="mask">
                            <img src="{{ asset('storage/app/products/') }}/<% special.slug %>/<% special.image[0] %>" alt="<% special.slug %>">
                        </div>

                        <span class="badge">- <% special.discount_percent %>%</span>

                        <span class="productName"><% special.name %></span>
                        <h4 class="productYear"><% special.year %></h4>
                        <h3 class="productPrice"><% special.price | currency:VND:0 | commaToDot | removeUSCurrency  %> vnđ</h3>
                        <br>
                        <a class="btn btn-primary" href="#" role="button">Thử rượu miễn phí</a>

                        <div class="hover">
                            <span class="productName"><% special.name %></span>
                            <h4 class="productYear"><% special.year %></h4>
                            <h3 class="productPrice"><% special.price | currency:VND:0 | commaToDot | removeUSCurrency  %> vnđ</h3>
                            <br>
                            <!--<p ng-bind-html="$sce.trustAsHtml(special.description)"></p>-->
                            <br>
                            <a class="btn btn-outline" href="#" role="button" ng-click="addToCart(special.id)">Thêm vào giỏ hàng</a>
                            <br>
                            <a class="btn btn-outline" href="{{ url('/san-pham/chi-tiet') }}/<% special.slug %>" role="button"  target="_self" >Xem chi tiết</a>
                            <br>
                            <a class="btn btn-outline" href="#" role="button" ng-click="addToTasting(special.id)">Thử rượu miên phí</a>
                            @if(!Auth::guest())
                                <br>
                                <a class="btn btn-outline" href="#" role="button" ng-click="addToLikeProduct(special.id)" ><% special.like %></a>
                            @else
                                <br>
                                <a class="btn btn-outline" href="#" role="button" ng-click="login()" >Lưu yêu thích</a>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container product_list">
            <div class="row">
                <div class="container-fluid">
                    <div class="title_big">
                        Sản phẩm khuyến mãi
                    </div>

                    <div class="row">
                        <div class="item col-md-3 col-sm-6 col-xs-12" ng-repeat="discount in discounts">
                            <div class="inner">
                                <div class="mask">
                                    <img src="{{ asset('storage/app/products/') }}/<% discount.slug %>/<% discount.image[0] %>" alt="<% discount.slug %>">
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
                                    <!--<p ng-bind-html="$sce.trustAsHtml(discount.description)"></p>-->
                                    <br>
                                    <a class="btn btn-outline" href="#" role="button" ng-click="addToCart(discount.id)">Thêm vào giỏ hàng</a>
                                    <br>
                                    <a class="btn btn-outline" href="{{ url('/san-pham/chi-tiet') }}/<% discount.slug %>" role="button"  target="_self" >Xem chi tiết</a>
                                    <br>
                                    <a class="btn btn-outline" href="#" role="button" ng-click="addToTasting(discount.id)">Thử rượu miên phí</a>
                                    @if(!Auth::guest())
                                        <br>
                                        <a class="btn btn-outline" href="#" role="button" ng-click="addToLikeProduct(discount.id)" ><% discount.like %></a>
                                    @else
                                        <br>
                                        <a class="btn btn-outline" href="#" role="button" ng-click="login()" >Lưu yêu thích</a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid" id="tasting_wine" style="background-image: url({{ asset ("storage/app/") }}/{!!$try_wine->image!!});">
            <div class="row">
                <div class="left col-md-4 col-sm-6 col-xs-12 col-md-offset-1 col-sm-offset-1">
                    <div class="title_mid text text-center">
                        Đăng ký thử rượu
                    </div>

                    <p>{!!$try_wine->description!!}</p>

                    <a class="btn btn-primary" href="#" role="button" data-toggle="modal" data-target="#tastingWine_UG">Huong dan dang kys thu ruou</a>
                </div>
            </div>
        </div>

        <div class="container" id="news">
            <div class="container">
                <div class="title_big">
                    Tin tức
                </div>
                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-12" ng-repeat="new in news">
                        <div class="inner">
                            <div class="mask">
                                <img src="{{ asset('storage/app') }}/<% new.image %>" alt="ảnh mình họa bài viết">
                            </div>
                            <a href="#">
                                <h3><% new.title %></h3>
                            </a>
                            <p ng-bind-html="$sce.trustAsHtml(new.description)"></p>
                            <br>
                            <a href="{{ url('bai-viet/chi-tiet/') }}/<% new.slug %>" class="btn btn-primary" target="_self" >Xem thêm <i class="fa fa-angle-double-right" aria-hidden="false"></i> </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <section class="container-fluid" id="about-homepage">
            <div class="row" ng-repeat="introduce in introduce">

                <div class="right col-md-6 col-sm-6 col-xs-12 col-md-offset-6 col-sm-offset-6" ng-if="introduce.slug == 've-chung-toi' ">
                    <div class="left hidden-xs"  style="background-image: url({{ asset ("storage/app/") }}/{!!$about->image!!});"></div>
                    <div class="title_big">
                        Về chúng tôi
                    </div>
                    <p ng-bind-html="$sce.trustAsHtml(introduce.content)"></p>


                    <div class="row">
                        <div class="item col-md-4 col-sm-4 col-xs-12">
                            <i class="fa fa-3x fa-phone" aria-hidden="false"></i>
                            <br>
                            <h4>Hỗ trợ qua điện thoại</h4>
                            <p><?php echo json_decode($about->description)[0]; ?></p>
                        </div>

                        <div class="item col-md-4 col-sm-4 col-xs-12">
                            <i class="fa fa-3x fa-truck" aria-hidden="false"></i>
                            <br>
                            <h4>Miễn phí giao hàng</h4>
                            <p><?php echo json_decode($about->description)[1]; ?></p>
                        </div>

                        <div class="item col-md-4 col-sm-4 col-xs-12">
                            <i class="fa fa-3x fa-user-o" aria-hidden="false"></i>
                            <br>
                            <h4>Hỗ trợ người mua hàng</h4>
                            <p><?php echo json_decode($about->description)[2]; ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- InstanceEndEditable -->
    </div>
</section>

    <div class="modal fade" id="tastingWine_UG" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Huong dan dang ky thu ruou</h4>
                </div>
                <div class="modal-body">
                    <div class="cover">
                        <img src="{{ asset ("storage/app/") }}/{!!$try_wine->image!!}" alt="cover" width=100%>
                    </div>
                    <article>
                        {!!$try_wine->content!!}
                    </article>

                    <a href="{{ url('san-pham') }}" target="_self" role="button" class="btn btn-primary">
                        Sản phẩm
                    </a>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="{{ asset ("public/frontend/app/controllers/homepage.js") }}"></script>
    <script src="{{ asset ("public/frontend/app/controllers/modal.js") }}"></script>
@endsection
