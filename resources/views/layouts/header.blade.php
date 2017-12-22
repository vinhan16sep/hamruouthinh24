<section class="top_header container-fluid">
    <div class="container">
        <div class="social_link col-md-6">
            <ul class="list-inline">
                <li>
                    <a href="javascript:void(0)" target="_blank">
                        <i class="fa fa-facebook-f"></i>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" target="_blank">
                        <i class="fa fa-youtube-square"></i>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" target="_blank">
                        <i class="fa fa-phone"></i> Hotline: <strong>(0274) 3717 508</strong>
                    </a>
                </li>
            </ul>
        </div>
        <div class="secondary_nav col-md-6">
            <ul class="list-inline text-right">
                <li>
                    <a href="javascript:void(0)" target="_blank">
                        Đại lý phân phối
                    </a>
                </li>
                <li>
                    |
                </li>
                <li>
                    <a href="javascript:void(0)" target="_blank">
                        Tuyển dụng
                    </a>
                </li>
            </ul>
        </div>
    </div>
</section>

<header class="header">
    <section class="container">
        <div class="logo col-md-2 col-xs-6">
            <a href="index.html">
                {{ HTML::image('public/frontend/img/logo.png') }}
            </a>
        </div>
        <div class="nav col-md-10 col-xs-6">
            <div class="user pull-right">
                <div class="icon pull-left">
                    <ul class="list-inline">
                        <li>
                            <a href="wishlist.html">
                                <i class="fa fa-2x fa-heart-o"></i> <span class="badge">0</span>
                            </a>
                        </li>
                        <li>
                            <a href="{{ url('xem-gio-hang') }}" target="_self">
                                <i class="fa fa-2x fa-shopping-cart"></i> <span class="badge" ng-bind="countAddedProducts"></span>
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="login pull-left">
                    @if (Auth::guest())
                        <div class="dropdown login_dropdown">
                            <a href="" data-toggle="modal" data-target="#user_login"> <strong>Đăng nhập</strong> </a>
                            hoặc
                            <a href="" data-toggle="modal" data-target="#user_register"> <strong>Đăng ký</strong> </a>
                        </div>
                    @else
                        Xin chào, <a href="{{ url('thong-tin-ca-nhan') }}" target="_self"><strong>{{ Auth::user()->name }}</strong></a>
                        <br>
                        <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                            Thoát
                        </a>

                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form>
                    @endif
                </div>
            </div>
            <br>
            <br>
            <div class="nav-list pull-right">
                <ul class="list-inline">
                    <li>
                        <a href="{{ url('') }}" target="_self">
                            Trang chủ
                        </a>
                    </li>
                    <li>
                        <a href="{{ url('gioi-thieu') }}" target="_self">
                            Giới thiệu
                        </a>
                    </li>
                    <li>
                        <a href="{{ url('san-pham') }}" target="_self">
                            Sản phẩm
                        </a>
                    </li>
                    <li>
                        <a href="{{ url('tu-van') }}" target="_self">
                            Tư vấn
                        </a>
                    </li>
                    <li>
                        <a href="{{ url('tin-tuc') }}" target="_self">
                            Tin tức
                        </a>
                    </li>
                    <li>
                        <a href="{{ url('lien-he') }}" target="_self">
                            Liên hệ
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
</header>