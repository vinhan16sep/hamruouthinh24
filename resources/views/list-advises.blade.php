@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/blog.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="BlogController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-9 col-xs-12">
                    <div class="media" ng-repeat="advise in advises">
                        <div class="media-left">
                            <a href="{{ url('tu-van') }}/<% advise.slug %>" target="_self">
                                <img src="{{ asset('storage/app') }}/<% advise.image %>" class="media-object" alt="ảnh tin tức">
                            </a>
                        </div>
                        <div class="media-body">
                            <a href="{{ url('tu-van') }}/<% advise.slug %>" target="_self">
                                <h3 class="media-heading"><% advise.title %></h3>
                            </a>
                            <p class="description"><% advise.description %></p>
                            <a href="{{ url('tu-van') }}/<% advise.slug %>" target="_self">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="nav_side col-md-3 col-sm-3 col-xs-12">
                    <h3>Phân loại bài viết</h3>
                    <ul class="list-unstyled">
                        <li ng-repeat="category in categories">
                            <a href="{{ url('tu-van/danh-muc') }}/<% category.slug %>" target="_self"><% category.title %></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/blog.js") }}"></script>
@endsection