@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/blog.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="BlogController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-9 col-xs-12">
                    <div class="media" ng-repeat="item in news">
                        <div class="media-left">
                            <a href="{{ url('tin-tuc') }}/<% item.slug %>" target="_self">
                                <img src="{{ asset('storage/app') }}/<% item.image %>" class="media-object" alt="ảnh tin tức">
                            </a>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading"><% item.title %></h3>
                            <p class="description"><% item.description %></p>
                            <a href="{{ url('tin-tuc') }}/<% item.slug %>" target="_self">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="nav_side col-md-3 col-sm-3 col-xs-12">
                    <h3>Phân loại bài viết</h3>
                    <ul class="list-unstyled">
                        <li ng-repeat="category in categories">
                            <a href="{{ url('tin-tuc/danh-muc') }}/<% category.slug %>" target="_self"><% category.title %></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/blog.js") }}"></script>
@endsection