  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="{{ asset("public/admin/bower_components/AdminLTE/dist/img/user2-160x160.jpg") }}" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>{{ Auth::user()->name}}</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <!-- Optionally, you can add icons to the links -->
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>Bài viết giới thiệu</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{ url('admin/introduce/ve-chung-toi') }}">Về chúng tôi</a></li>
            <li><a href="{{ url('admin/introduce/tam-nhin-chien-luoc') }}">Tầm nhìn chiến lược</a></li>
            <li><a href="{{ url('admin/introduce/su-menh') }}">Sứ mệnh</a></li>
            <li><a href="{{ url('admin/introduce/chung-nhan') }}">Chứng nhận</a></li>
            <li><a href="{{ url('admin/introduce/dieu-khoan') }}">Điểu khoản</a></li>
            <li><a href="{{ url('admin/library') }}">Thư viện ảnh</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>Quản lý sản phẩm</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{ url('admin/trademark') }}">Thương hiệu</a></li>
            <li><a href="{{ url('admin/category') }}">Danh mục</a></li>
            <li><a href="{{ url('admin/product') }}">Sản phẩm</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>Quản lý đơn hàng</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{ url('admin/order/pending') }}">Chờ xác nhận</a></li>
            <li><a href="{{ url('admin/order/ongoing') }}">Đã xác nhận</a></li>
            <li><a href="{{ url('admin/order/complete') }}">Đã hoàn thành</a></li>
            <li><a href="{{ url('admin/order/cancel') }}">Đã bỏ qua</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>Quản lý bài viết</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="{{ url('admin/blog-category') }}">Danh mục</a></li>
          </ul>
          <ul class="treeview-menu">
            <li><a href="{{ url('admin/advise') }}">Tư vấn</a></li>
            <li><a href="{{ url('admin/news') }}">Tin tức</a></li>
          </ul>
        </li>
{{--        <li><a href="{{ route('user-management.index') }}"><i class="fa fa-link"></i> <span>User management</span></a></li>--}}
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>