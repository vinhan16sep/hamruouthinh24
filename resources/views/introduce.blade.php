@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/intro.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="IntroduceController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="row">
                <div class="nav_side col-md-3 col-sm-3 col-xs-12">
                    <h3>Giới thiệu</h3>
                    <ul class="nav nav-pills nav-stacked" role="tablist">
                        <li role="presentation" class="active"><a href="#ve-chung-toi" aria-controls="ve-chung-toi" role="tab" data-toggle="tab">Về chúng tôi</a></li>
                        <li role="presentation"><a href="#tam-nhin-chien-luoc" aria-controls="tam-nhin-chien-luoc" role="tab" data-toggle="tab">Tầm nhìn chiến lược</a></li>
                        <li role="presentation"><a href="#su-menh" aria-controls="su-menh" role="tab" data-toggle="tab">Sứ mệnh</a></li>
                        <li role="presentation"><a href="#chung-nhan" aria-controls="chung-nhan" role="tab" data-toggle="tab">Chứng nhận</a></li>
                        <li role="presentation"><a href="#dieu-khoan" aria-controls="dieu-khoan" role="tab" data-toggle="tab">Điều khoản</a></li>
                        <li role="presentation"><a href="#thu-vien-anh" aria-controls="thu-vien-anh" role="tab" data-toggle="tab">Thư viện hình ảnh</a></li>
                    </ul>
                </div>

                <div class="col-md-9 col-sm-9 col-xs-12">
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane" id="<% item.slug %>" ng-repeat="item in introduce" active-on-first-item>
                            <img src="{{ asset('storage/app') }}/<% item.image %>" class="cover" alt="<% item.title %>">
                            <h3><% item.title %></h3>
                            <p ng-bind-html="$sce.trustAsHtml(item.content)"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/introduce.js") }}"></script>
@endsection