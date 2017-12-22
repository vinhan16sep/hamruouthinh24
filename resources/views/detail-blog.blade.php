@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/blog.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="DetailBlogController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-9 col-xs-12">

                    <h3><% selected.title %></h3>

                    <p ng-bind-html="$sce.trustAsHtml(selected.content)"></p>
                </div>

                <div class="nav_side col-md-3 col-sm-3 col-xs-12">
                    <h3>Phân loại bài viết</h3>
                    <ul class="list-unstyled">
                        <li ng-repeat="category in categories">
                            <a href="{{ url('') }}/<% (category.type == 0) ? 'tu-van' : 'tin-tuc' %>/danh-muc/<% category.slug %>" target="_self"><% category.title %></a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/detail-blog.js") }}"></script>
@endsection