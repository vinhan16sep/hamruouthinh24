@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/checkout.css")}}" rel="stylesheet" type="text/css" />

    <section class="main_content" ng-controller="TastingController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="col-md-10 col-sm-12 col-md-offset-1">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 alert alert-success" ng-show="showMessage">
                        <h3><strong><% successMessage1 %></strong></h3>
                        <h4><strong><% successMessage2 %></strong><strong style="color: red"><% orderCode | uppercase %></strong></h4>
                        <h4 ng-show="customerInfo.paymentMethod == 2"><% successMessage3 %><strong style='color:red'><% customerInfo.name %> <% orderCode | uppercase %></strong></h4>
                        <br>
                        {{--<h3><strong><% successMessage2 %></strong></h3>--}}
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <h3><strong>Thông tin khách hàng</strong></h3>

                        <h5><strong>Họ tên (*)</strong></h5>
                        <% customerInfo.name %>
                        <h5><strong>Email</strong></h5>
                        <% customerInfo.email %>
                        <h5><strong>Điện thoại</strong></h5>
                        <% customerInfo.phone %>
                        <h5><strong>Địa chỉ thử rượu</strong></h5>
                        <% customerInfo.address %>
                        <br>
                        <% customerInfo.district %>
                        <br>
                        <% customerInfo.city %>
                        <h5><strong>Thời gian thử rượu</strong></h5>
                        <% customerInfo.time %>
                        <br>
                        <h5><strong>Ghi chú</strong></h5>
                        <% customerInfo.content %>
                        <br>
                        <br>
                        <br>
                        <button class="btn btn-primary" ng-disabled="hideButton" ng-click="checkout()">Đặt Lịch</button>
                    </div>
                </div>
            </div>
        </div>

        
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/tasting.js") }}"></script>
@endsection