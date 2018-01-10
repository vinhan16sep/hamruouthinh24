@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/blog.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="BlogController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-9 col-xs-12">
                    <div class="row">

                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="inner">
                                <img src="{{ asset('public/frontend/img/blog_03.jpg') }}" alt="ảnh mình họa bài viết">
                                <a href="#">
                                    <h3>Nullam in lacus pharetra, varius nibh ut, imperdiet nisi.</h3>
                                </a>
                                <br>
                                <p>Donec et nulla quam. Pellentesque euismod nunc ac mollis suscipit. Vestibulum posuere fermentum scelerisque. Mauris lacus tortor, porttitor ut laoreet in, maximus vitae urna. In nec lectus rhoncus, blandit dolor in, blandit magna. Cras et justo orci. Sed in lectus vel diam congue pulvinar. Suspendisse at nunc tincidunt, imperdiet sapien eget, lacinia lectus. Quisque eu cursus sapien, eget posuere sapien. Nulla facilisi. Vestibulum enim libero, auctor in augue eu, facilisis laoreet metus.</p>
                                <br>
                                <a href="{{ url('tin-tuc') }}/tin-tuc" target="_self" class="btn btn-primary">Xem thêm <i class="fa fa-angle-double-right" aria-hidden="false"></i> </a>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="inner">
                                <img src="{{ asset('public/frontend/img/blog_04.jpg') }}" alt="ảnh mình họa bài viết">
                                <a href="#">
                                    <h3>Nullam in lacus pharetra, varius nibh ut, imperdiet nisi.</h3>
                                </a>
                                <br>
                                <p>Donec et nulla quam. Pellentesque euismod nunc ac mollis suscipit. Vestibulum posuere fermentum scelerisque. Mauris lacus tortor, porttitor ut laoreet in, maximus vitae urna. In nec lectus rhoncus, blandit dolor in, blandit magna. Cras et justo orci. Sed in lectus vel diam congue pulvinar. Suspendisse at nunc tincidunt, imperdiet sapien eget, lacinia lectus. Quisque eu cursus sapien, eget posuere sapien. Nulla facilisi. Vestibulum enim libero, auctor in augue eu, facilisis laoreet metus.</p>
                                <br>
                                <a href="#" class="btn btn-primary">Xem thêm <i class="fa fa-angle-double-right" aria-hidden="false"></i> </a>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="inner">
                                <img src="{{ asset('public/frontend/img/blog_05.jpg') }}" alt="ảnh mình họa bài viết">
                                <a href="#">
                                    <h3>Nullam in lacus pharetra, varius nibh ut, imperdiet nisi. Nullam in lacus pharetra, varius nibh ut, imperdiet nisi.</h3>
                                </a>
                                <br>
                                <p>Donec et nulla quam. Pellentesque euismod nunc ac mollis suscipit. Vestibulum posuere fermentum scelerisque. Mauris lacus tortor, porttitor ut laoreet in, maximus vitae urna. In nec lectus rhoncus, blandit dolor in, blandit magna. Cras et justo orci. Sed in lectus vel diam congue pulvinar. Suspendisse at nunc tincidunt, imperdiet sapien eget, lacinia lectus. Quisque eu cursus sapien, eget posuere sapien. Nulla facilisi. Vestibulum enim libero, auctor in augue eu, facilisis laoreet metus.</p>
                                <br>
                                <a href="#" class="btn btn-primary">Xem thêm <i class="fa fa-angle-double-right" aria-hidden="false"></i> </a>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="nav_side col-md-3 col-sm-3 col-xs-12">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading">Danh mục tin tức</div>

                        <!-- List group -->
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="javascript:void(0);">Tin tức mới</a>
                            </li>
                            <li class="list-group-item">
                                <a href="javascript:void(0);">Tin nhập khẩu</a>
                            </li>
                            <li class="list-group-item">
                                <a href="javascript:void(0);">Tuyển dụng</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/blog.js") }}"></script>
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