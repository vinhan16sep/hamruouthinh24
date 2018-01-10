@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/blog.css")}}" rel="stylesheet" type="text/css" />
    <section class="main_content" ng-controller="DetailBlogController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="row">
                <div class="content col-md-9 col-sm-9 col-xs-12">
                    <article>
                        <h2>Nullam in lacus pharetra, varius nibh ut, imperdiet nisi.</h2>

                        <blockquote>
                            <p>Lời giới thiệu ngắn cho bài viết.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                            <footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
                        </blockquote>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et felis a justo tincidunt luctus. In pellentesque lacinia nunc in dignissim. In consequat nulla massa, eget tristique libero scelerisque in. Praesent gravida dictum eros, finibus faucibus neque dictum a. Nulla mattis arcu quis tempus commodo. Praesent et dictum diam. Phasellus eget magna id justo euismod laoreet. Suspendisse aliquet, ligula sed ullamcorper iaculis, nulla lectus consectetur odio, non lacinia enim risus eu orci. Cras finibus felis nec metus pulvinar, quis tempus orci hendrerit.</p>

                        <img src="{{ asset('public/frontend/img/cover/cover_01.jpg') }}" alt="preview">

                        <p>Fusce ultricies ligula et blandit tempor. Nam eu lectus orci. Phasellus a diam varius, gravida libero vitae, tempor velit. Mauris ultrices rhoncus risus, at pharetra massa dapibus ut. Aenean convallis quam et ornare cursus. Mauris tempor vestibulum egestas. Ut pretium libero in lacus finibus malesuada. Donec sit amet lobortis erat. Phasellus ut elementum lacus. Fusce aliquam ante ut quam pharetra volutpat. Proin nulla ex, congue at egestas eget, pharetra id odio.</p>

                        <img src="{{ asset('public/frontend/img/cover/cover_03.jpg') }}" alt="preview">

                        <p>Quisque interdum rhoncus ullamcorper. Maecenas velit odio, maximus nec pulvinar in, fringilla et augue. Nunc dictum mauris eu dapibus congue. Fusce rutrum eget massa nec sagittis. Proin quam nisl, ornare vitae nisl sed, egestas accumsan purus. Aliquam diam turpis, euismod sit amet luctus eu, congue a velit. Pellentesque commodo odio tincidunt, finibus ex eget, maximus eros. Suspendisse eleifend dolor vitae suscipit blandit. Etiam ullamcorper dolor vitae ante maximus, ac rhoncus nulla vehicula. Duis quis libero lacus.</p>

                        <p>Fusce ultricies ligula et blandit tempor. Nam eu lectus orci. Phasellus a diam varius, gravida libero vitae, tempor velit. Mauris ultrices rhoncus risus, at pharetra massa dapibus ut. Aenean convallis quam et ornare cursus. Mauris tempor vestibulum egestas. Ut pretium libero in lacus finibus malesuada. Donec sit amet lobortis erat. Phasellus ut elementum lacus. Fusce aliquam ante ut quam pharetra volutpat. Proin nulla ex, congue at egestas eget, pharetra id odio.</p>


                        <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/rkSIUJZed8s" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

                        <p>Nullam quis dui nec sapien eleifend euismod. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam varius urna quis enim bibendum feugiat. Fusce lacus eros, pretium id consequat eget, suscipit ut nulla. Proin eu magna luctus, lacinia risus rhoncus, convallis enim. Pellentesque molestie ultricies orci vel tempor. Praesent orci urna, porttitor ut semper in, aliquam in enim. Sed mattis libero at ex rhoncus, sit amet commodo metus ultrices. Nam eleifend, justo et dapibus pharetra, odio orci bibendum ante, eu mollis orci dui nec magna. Nulla in semper nunc. Curabitur vel porttitor orci, in laoreet lacus. Maecenas consequat, lacus ac aliquet efficitur, est lectus placerat nulla, at suscipit felis orci vel urna. Nunc sollicitudin rhoncus pharetra. Nunc semper ipsum vitae mauris cursus, vel vehicula nunc consectetur. Maecenas id tempor metus.</p>

                        <p>Etiam commodo quam id ante vestibulum, ut eleifend felis mollis. Vestibulum sodales nulla at vestibulum lacinia. Morbi mattis velit sodales neque consectetur maximus. Quisque porta orci porta, dignissim tellus rhoncus, volutpat massa. Proin sed libero diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur id ante lacinia, luctus leo eu, cursus ante. Donec est risus, sodales at turpis tincidunt, malesuada sollicitudin lectus. Sed ultricies elit sed nibh auctor sollicitudin. Donec rhoncus arcu eget ante interdum, a mattis magna posuere. Mauris vel ex at velit feugiat commodo pretium a metus. Nulla tempus congue augue, ac consequat ipsum consequat a. Mauris interdum eleifend sagittis. Donec blandit nisi quam, at faucibus mauris consequat nec.</p>

                        <blockquote class="blockquote-reverse">
                            <footer>Tác giả bài viêt</footer>
                            Trích dẫn nguồn từ <a href="javascript:void(0);" target="_blank">Website dẫn nguồn</a>
                        </blockquote>
                    </article>

                    <div class="comments">
                        <div class="comments_post">
                            <h3>Bình luận</h3>

                            <div class="form-group">
                                <label for="inputName">Họ tên</label>
                                <input type="text" class="form-control" id="inputName" placeholder="VD: Nguyễn Văn An">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">Email</label>
                                <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <label for="inputTitle">Tiêu đề</label>
                                <input type="text" class="form-control" id="inputTitle" placeholder="Tiêu đề">
                            </div>
                            <div class="form-group">
                                <label for="inputMessage">Nội dung</label>
                                <textarea class="form-control" id="inputMessage" placeholder="Viết cho chúng tôi cảm nhận của bạn" rows="4"></textarea>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary" type="submit" id="sendComment">Gửi đánh giá</button>
                            </div>
                        </div>

                        <div class="comments_posts_list">

                            <table class="table">
                                <?php for($i = 0; $i < 3; $i++){ ?>
                                    <div class="media">
                                        <div class="media-left">
                                            <img class="media-object" src="{{ asset('public/frontend/img/users_ava.png') }}" alt="users_ava">
                                        </div>
                                        <div class="media-body">
                                            <h4 class="media-heading">Tên khách hàng</h4>
                                            <p>Quisque interdum rhoncus ullamcorper. Maecenas velit odio, maximus nec pulvinar in, fringilla et augue. Nunc dictum mauris eu dapibus congue. Fusce rutrum eget massa nec sagittis.</p>
                                        </div>
                                    </div>
                                <?php } ?>
                            </table>
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
    <script src="{{ asset ("public/frontend/app/controllers/detail-blog.js") }}"></script>
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