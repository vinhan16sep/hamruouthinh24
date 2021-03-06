<footer class="footer">
    <div class="container-fluid">
        <div class="container">
        <div class="row">
            <div class="item col-md-4 col-sm-6 col-xs-12">
                <h3>Liên hệ với chúng tôi</h3>
                <p><?php echo $contact->company; ?></p>
                <table class="table">
                    <tr>
                        <td><i class="fa fa-map-marker" aria-hidden="true"></i></td>
                        <td><?php echo $contact->address; ?></td>
                    </tr>
                    <tr>
                        <td><i class="fa fa-phone" aria-hidden="true"></i></td>
                        <td><?php echo $contact->numberphone; ?></td>
                    </tr>
                    <tr>
                        <td><i class="fa fa-envelope-o" aria-hidden="true"></i></td>
                        <td><?php echo $contact->email; ?></td>
                    </tr>
                </table>
            </div>
            <div class="item col-md-4 col-sm-6 col-xs-12">
                <h3>Trợ giúp</h3>
                <ul class="list-unstyled">
                    <li>
                        <a href="javascript:void(0)">
                            Về cửa hàng
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            Tư vấn
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            Liên hệ
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            Sản phẩm
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            Điều khoản
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            Câu hỏi thường gặp
                        </a>
                    </li>
                </ul>
            </div>
            <div class="item col-md-4 col-sm-6 col-xs-12" ng-controller="SubscribeController">
                <h3>Đăng ký nhận thông báo</h3>
                <p>Integer faucibus consequat quam, et efficitur odio ac augue laoreet, vel feugiat sapien ornare.</p>

                <form>
                    <div class="input-group">
                        <input type="email" class="form-control" placeholder="Email của khách hàng" ng-model="user.email" id="subs_email">
                        <span class="input-group-btn">
                  <input type="submit" ng-click="send(user)" class="btn btn-primary" value="Đăng ký" />
                </span>

                    </div><!-- /input-group -->
                </form>
                <ul class="list-inline list-unstyled">
                    <li>
                        <a href="javascript:void(0);" target="_blank">
                            <i class="fa fa-2x fa-facebook-f" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" target="_blank">
                            <i class="fa fa-2x fa-youtube-square" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" target="_blank">
                            <i class="fa fa-2x fa-linkedin-square" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    </div>
    <div class="container-fluid copyright">
        <div class="container">
              <div class="col-md-6 col-sm-6 col-xs-12">
                Copyright 2018 hamruouthinh24. All Rights Reversed.
              </div>
              <div class="col-md-6 col-sm-6 col-xs-12 text-right">

              </div>
        </div>
    </div>
</footer>

<button type="button" id="requestQuotationBtn" class="btn btn-primary" data-toggle="modal" data-target="#requestQuotation">
    <i class="fa fa-2x fa-dollar" aria-hidden="true" title="Đăng ký nhận báo giá"></i>
</button>

<div class="scrollup">
    <i class="fa fa-chevron-up fa-2x"></i>
</div>

<script type="text/javascript">
  if(document.querySelector('#map-contact iframe')){
    document.querySelector('#map-contact iframe').style.width = '100%';
    document.querySelector('#map-contact iframe').style.height = '700px';
  }
</script>
<script type="text/javascript">
    for (var i = 0; i < document.querySelectorAll('#banner .item img').length; i++) {
      document.querySelectorAll('#banner .item img')[i].style.width = '100%';
      document.querySelectorAll('#banner .item img')[i].style.height = '100%';
      
    }
</script>
