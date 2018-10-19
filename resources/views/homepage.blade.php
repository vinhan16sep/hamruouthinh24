@extends('layouts.frontend-template')
@section('content')
<section id="homepage">
    <div class="big_cover">
        <div class="row">
            <div class="left col-md-3 hidden-xs">
                <ul>
                    <li>
                        <a href="">
                            <h3>abc <span class="pull-right"><i class="fa fa-caret-right" aria-hidden="false"></i></span> </h3>
                        </a>

                        <ul>
                            <li>
                                <a href="">
                                    <h3>abc 2 <span class="pull-right"><i class="fa fa-caret-right" aria-hidden="false"></i></span> </h3>
                                </a>
                                <ul>
                                    <li>
                                        <a href="">
                                            <h3>abc 3</h3>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="">
                            <h3>def <span class="pull-right"><i class="fa fa-caret-right" aria-hidden="false"></i></span> </h3>
                        </a>

                        <ul>
                            <li>
                                <a href="">
                                    <h3>def 2 <span class="pull-right"><i class="fa fa-caret-right" aria-hidden="false"></i></span> </h3>
                                </a>
                                <ul>
                                    <li>
                                        <a href="">
                                            <h3>def 3</h3>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
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

        <div class="container-fluid" id="tasting_wine">
            <div class="row">
                <div class="left col-md-4 col-sm-6 col-xs-12 col-md-offset-1 col-sm-offset-1">
                    <div class="title_mid">
                        Đăng ký thử rượu
                    </div>

                    <h2>Maecenas pulvinar tristique malesuada</h2>
                    <p>Vivamus ac tempor quam. Maecenas pulvinar tristique malesuada. Donec euismod nibh et dapibus tempor. Nullam elit nulla, rutrum eget eros sollicitudin, ullamcorper ultrices orci. Suspendisse potenti. Ut porta bibendum nibh eu viverra. Sed vel magna ac ligula finibus fermentum fringilla eu lectus. Sed elit ante, ornare nec dui at, molestie congue arcu. Nam at imperdiet neque, non tempus libero. Praesent dolor odio, mattis vulputate est ut, vulputate sollicitudin metus. Nulla id metus turpis. Phasellus non diam nisi. Duis vitae felis et magna elementum dictum. Pellentesque in enim fringilla, ullamcorper lacus et, imperdiet erat.</p>

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
                    <div class="left hidden-xs"></div>
                    <div class="title_big">
                        Về chúng tôi
                    </div>
                    <p ng-bind-html="$sce.trustAsHtml(introduce.content)"></p>


                    <div class="row">
                        <div class="item col-md-4 col-sm-4 col-xs-12">
                            <i class="fa fa-3x fa-phone" aria-hidden="false"></i>
                            <br>
                            <h4>Hỗ trợ qua điện thoại</h4>
                            <p>Suspendisse potenti. Cras molestie mi sed iaculis varius. Maecenas fermentum semper sagittis. Sed eu mattis tellus. Mauris dolor ligula, pellentesque id vestibulum nec, consectetur sed sem. Aenean at ante enim. Quisque dapibus ligula ut erat laoreet aliquet. Pellentesque dictum magna ante, venenatis scelerisque risus pretium eget. Nullam et orci vitae felis rutrum tempor. Vestibulum id maximus lacus.</p>
                        </div>

                        <div class="item col-md-4 col-sm-4 col-xs-12">
                            <i class="fa fa-3x fa-truck" aria-hidden="false"></i>
                            <br>
                            <h4>Miễn phí giao hàng</h4>
                            <p>Suspendisse potenti. Cras molestie mi sed iaculis varius. Maecenas fermentum semper sagittis. Sed eu mattis tellus. Mauris dolor ligula, pellentesque id vestibulum nec, consectetur sed sem. Aenean at ante enim. Quisque dapibus ligula ut erat laoreet aliquet. Pellentesque dictum magna ante, venenatis scelerisque risus pretium eget. Nullam et orci vitae felis rutrum tempor. Vestibulum id maximus lacus.</p>
                        </div>

                        <div class="item col-md-4 col-sm-4 col-xs-12">
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
                        <img src="{{ asset('public/frontend/img/cover/cover_02.jpg') }}" alt="cover">
                    </div>
                    <article>
                        <ol>
                            <li>
                                <h3>Buoc 1:</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aliquam pretium sapien, et gravida nisl vehicula a. Fusce nec augue eu velit tempus finibus in id diam. Vivamus pellentesque orci molestie justo dapibus, id posuere lectus placerat. Cras ut eros rutrum magna accumsan bibendum. Quisque laoreet, elit sit amet imperdiet euismod, lacus mauris consectetur orci, eget aliquam odio ante a massa. Vestibulum convallis egestas dignissim. Donec sit amet iaculis odio.</p>
                                <p>Morbi vel maximus ex. Vivamus sit amet cursus orci. Aliquam cursus bibendum lacus, quis congue justo. In volutpat, magna sit amet porta gravida, ante erat sodales eros, eget malesuada magna est vitae magna. Phasellus laoreet pharetra scelerisque. Nunc ex mauris, cursus eu ex a, mollis tempus nisi. Integer eleifend justo quam, a imperdiet urna pretium at. Sed porta nulla ut odio volutpat auctor. Maecenas et metus lacus. Integer metus sem, iaculis vel suscipit vel, aliquam at justo. Quisque quis condimentum nibh. Suspendisse hendrerit consequat ipsum, in malesuada urna vestibulum nec. Ut maximus, mi ut sodales lacinia, mauris eros varius lorem, et convallis felis diam eu sapien. Donec sollicitudin, nisl a blandit euismod, risus mauris tristique lectus, sed dignissim quam risus sit amet massa.</p>
                            </li>
                            <li>
                                <h3>Buoc 2:</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aliquam pretium sapien, et gravida nisl vehicula a. Fusce nec augue eu velit tempus finibus in id diam. Vivamus pellentesque orci molestie justo dapibus, id posuere lectus placerat. Cras ut eros rutrum magna accumsan bibendum. Quisque laoreet, elit sit amet imperdiet euismod, lacus mauris consectetur orci, eget aliquam odio ante a massa. Vestibulum convallis egestas dignissim. Donec sit amet iaculis odio.</p>
                                <p>Morbi vel maximus ex. Vivamus sit amet cursus orci. Aliquam cursus bibendum lacus, quis congue justo. In volutpat, magna sit amet porta gravida, ante erat sodales eros, eget malesuada magna est vitae magna. Phasellus laoreet pharetra scelerisque. Nunc ex mauris, cursus eu ex a, mollis tempus nisi. Integer eleifend justo quam, a imperdiet urna pretium at. Sed porta nulla ut odio volutpat auctor. Maecenas et metus lacus. Integer metus sem, iaculis vel suscipit vel, aliquam at justo. Quisque quis condimentum nibh. Suspendisse hendrerit consequat ipsum, in malesuada urna vestibulum nec. Ut maximus, mi ut sodales lacinia, mauris eros varius lorem, et convallis felis diam eu sapien. Donec sollicitudin, nisl a blandit euismod, risus mauris tristique lectus, sed dignissim quam risus sit amet massa.</p>
                            </li>
                            <li>
                                <h3>Buoc 3:</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aliquam pretium sapien, et gravida nisl vehicula a. Fusce nec augue eu velit tempus finibus in id diam. Vivamus pellentesque orci molestie justo dapibus, id posuere lectus placerat. Cras ut eros rutrum magna accumsan bibendum. Quisque laoreet, elit sit amet imperdiet euismod, lacus mauris consectetur orci, eget aliquam odio ante a massa. Vestibulum convallis egestas dignissim. Donec sit amet iaculis odio.</p>
                                <p>Morbi vel maximus ex. Vivamus sit amet cursus orci. Aliquam cursus bibendum lacus, quis congue justo. In volutpat, magna sit amet porta gravida, ante erat sodales eros, eget malesuada magna est vitae magna. Phasellus laoreet pharetra scelerisque. Nunc ex mauris, cursus eu ex a, mollis tempus nisi. Integer eleifend justo quam, a imperdiet urna pretium at. Sed porta nulla ut odio volutpat auctor. Maecenas et metus lacus. Integer metus sem, iaculis vel suscipit vel, aliquam at justo. Quisque quis condimentum nibh. Suspendisse hendrerit consequat ipsum, in malesuada urna vestibulum nec. Ut maximus, mi ut sodales lacinia, mauris eros varius lorem, et convallis felis diam eu sapien. Donec sollicitudin, nisl a blandit euismod, risus mauris tristique lectus, sed dignissim quam risus sit amet massa.</p>
                            </li>
                        </ol>
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
