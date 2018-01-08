@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/contact.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="DetailBlogController">
        <div class="container">
            <div class="row">
                <div class="contact-navside col-md-4 col-sm-4 col-xs-12">
                    <div class="content-title">
                        <h2>Liên hệ với chúng tôi</h2>
                    </div>
                    <address>
                        <strong>CTY TNHH MTV TM hóa mỹ phẩm Nam Anh Khương</strong>
                        <br>
                        Địa chỉ: 11/B6 KP. Bình Thuận 2, P.Thuận Giao, TX.Thuận An, Bình Dương
                        <br>
                        Điện thoại: 0650 3717507 hoặc 0983 979 567
                        <br>
                        Email: namanhkhuong@yahoo.com.vn
                        <br>
                        Website: www.hoamyphamnamanhkhuong.com
                    </address>

                    <div class="content-title">
                        <h2>Liên hệ với chúng tôi</h2>
                    </div>
                    <div class="contact-form">
                        <label for="inputName">Họ tên (*)</label>
                        <input type="type" class="form-control" id="inputName" placeholder="Họ tên">
                        <br>
                        <label for="inputEmail">Email (*)</label>
                        <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                        <br>
                        <label for="inputPhone">Số điện thoại (*)</label>
                        <input type="type" class="form-control" id="inputPhone" placeholder="Số điện thoại">
                        <br>
                        <label for="inputPhone">Lý do bạn đang cần liên hệ</label>
                        <select class="form-control" id="inputReason">
                            <option>Bạn đang cần liên hệ với chúng tôi vì...</option>
                            <option>Tôi đang cần tư vấn làm đẹp</option>
                            <option>Tôi đang cần tư vấn về sản phẩm</option>
                            <option>Tôi muốn tìm hiểu về ABC</option>
                            <option>Tôi muốn tìm hiểu về DEF</option>
                        </select>
                        <br>
                        <textarea class="form-control" rows="4" placeholder="Tin nhắn..."></textarea>
                        <br>
                        <button type="submit" class="btn btn-default btn-fill">Gửi đi</button>
                    </div>
                </div>

                <div class="col-md-8 col-sm-8 col-xs-12">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3917.071122493891!2d106.70708115086371!3d10.958000192160192!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d74dd0d7fc33%3A0x1fc08d96dc603ebc!2zTmjDoCBQaMOibiBQaOG7kWkgTeG7uSBQaOG6qW0gTmFtIEFuaCBLaMawxqFuZw!5e0!3m2!1svi!2s!4v1511858268013" width="100%" height="700" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/detail-blog.js") }}"></script>
    <script>
        $(window).scroll(function () {
            //if you hard code, then use console
            //.log to determine when you want the
            //nav bar to stick.
            'use strict';
            if ($(window).scrollTop() > 100) {
                $('.main_content').css( 'padding-top' , '280px');
            }
            if ($(window).scrollTop() < 100) {
                $('.main_content').css( 'padding-top' , '0');
            }
        });
    </script>
@endsection