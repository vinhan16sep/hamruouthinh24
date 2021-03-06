@extends('layouts.frontend-template')
@section('content')
    <section id="list-blogs">
        <div class="main_content" ng-controller="BlogController">
            <!-- InstanceBeginEditable name="content" -->
            <div class="container">
                <div class="row">
                    <div class="left col-md-9 col-sm-9 col-xs-12">
                        <div class="row">

                            <div class="item col-md-4 col-sm-4 col-xs-12" ng-repeat="blog in blogs">
                                <div class="inner">
                                    <div class="mask">
                                        <img src="{{ asset('storage/app') }}/<% blog.image %>" alt="ảnh mình họa bài viết">
                                    </div>

                                    <a href="{{ url('bai-viet/chi-tiet') }}/<% blog.slug %>" target="_self">
                                        <h3><% blog.title %></h3>
                                    </a>
                                    <br>
                                    <p ng-bind-html="$sce.trustAsHtml(blog.description)"></p>
                                    <br>
                                    <a href="{{ url('bai-viet/chi-tiet') }}/<% blog.slug %>" class="btn btn-primary" target="_self" >Xem thêm <i class="fa fa-angle-double-right" aria-hidden="false"></i> </a>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="nav_side col-md-3 col-sm-3 col-xs-12">
                        <div class="panel panel-default">
                            <!-- Default panel contents -->
                            <div class="panel-heading">Danh mục tư vấn</div>

                            <!-- List group -->
                            <ul class="list-group">
                                <li class="list-group-item" ng-repeat="category in postsCategories">
                                    <a href="{{ url('bai-viet') }}/<% category.slug %>" target="_self" ><% category.title %></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- InstanceEndEditable -->
        </div>
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/blog.js") }}"></script>

@endsection