@extends('layouts.frontend-template')
@section('content')
    <link href="{{ asset("public/frontend/css/cart.css")}}" rel="stylesheet" type="text/css" />

    <section class="main_content" ng-controller="TastingController">
        <!-- InstanceBeginEditable name="content" -->
        <div class="container">
            <div class="col-md-8 col-sm-12 col-md-offset-2">
                <div class="row">
                    <h3><strong>Thông tin khách hàng</strong></h3>
                    <form name="guestInfo" ng-submit="submitForm()">
                        @if (Auth::guest())
                            <input type="hidden" name="hidden" value="0" />
                        @else
                            <input type="hidden" name="hidden" value="{{ Auth::user()->id }}" />
                        @endif
                        <div class="form-group">
                            <label for="inputFirstName">Họ tên (*)</label>
                            <input type="text" class="form-control" name="inputName" placeholder="VD: Nguyễn" ng-model="customerInfo.name" required>
                            <div role="alert">
                                <span class="error" style="color:red" ng-show="(customerInfo.inputName.$dirty || submitted) && customerInfo.inputName.$error.required">
                                    Bắt buộc nhập!
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail">Email</label>
                            <input type="email" class="form-control" name="inputEmail" placeholder="Email" ng-model="customerInfo.email" required>
                            <div role="alert">
                                <span class="error" style="color:red" ng-show="(customerInfo.inputEmail.$dirty || submitted) && customerInfo.inputEmail.$error.required">
                                    Bắt buộc nhập!
                                </span>
                                <span class="error" style="color:red" ng-show="(customerInfo.inputEmail.$dirty || submitted) && customerInfo.inputEmail.$error.email">
                                    Sai định dạng email!
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPhoneNumer">Điện thoại</label>
                            <input type="text" class="form-control" name="inputPhoneNumer" placeholder="VD: 0912345678" ng-model="customerInfo.phone" numbers-only="" required>
                            <span class="error" style="color:red" ng-show="((customerInfo.inputPhoneNumer.$dirty || submitted) && customerInfo.inputName.$dirty || submitted) && customerInfo.inputPhoneNumer.$error.required">
                                Bắt buộc và chỉ cho phép nhập số!
                            </span>
                        </div>
                        <div class="form-group">
                            <label for="inputAdress">Địa chỉ giao hàng</label>
                            <input type="text" class="form-control" name="inputAdress" placeholder="Số nhà (ngõ / ngách), Phố / Phường" ng-model="customerInfo.address" required>
                            <div role="alert">
                                <span class="error" style="color:red" ng-show="(customerInfo.inputAdress.$dirty || submitted) && customerInfo.inputAdress.$error.required">
                                    Bắt buộc nhập!
                                </span>
                            </div>
                            <br>
                            <input type="text" class="form-control" name="inputDistrict" placeholder="Quận" ng-model="customerInfo.district" required>
                            <div role="alert">
                                <span class="error" style="color:red" ng-show="(customerInfo.inputDistrict.$dirty || submitted) && customerInfo.inputDistrict.$error.required">
                                    Bắt buộc nhập!
                                </span>
                            </div>
                            <br>
                            <input type="text" class="form-control" name="inputCity" placeholder="Thành phố" ng-model="customerInfo.city" required>
                            <div role="alert">
                                <span class="error" style="color:red" ng-show="(customerInfo.inputCity.$dirty || submitted) && customerInfo.inputCity.$error.required">
                                    Bắt buộc nhập!
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputAdress">Thời gian thư rượu</label>
                            <input type="text" class="form-control" name="inputTime" placeholder="" ng-model="customerInfo.time" id="dob">
                        </div>
                        <small>Những thông tin (*) là bắt buộc</small>
                        <br>
                        <br>
                        @if (!Auth::guest())
                            <button type="button" class="btn btn-primary" ng-click="getLoggedInfo()">
                                <i class="fa fa-user"></i> Sử dụng thông tin tài khoản đã đăng ký
                            </button>
                        @endif

                        <div class="form-group">
                            <label for="inputNote">Ghi chú</label>
                            <textarea class="form-control" id="inputNote" rows="3" ng-model="customerInfo.content" placeholder="Thời gian thử rượu (Giờ : Phút : Giây)"></textarea>
                        </div>

                        <br>
                        <br>
                        <a class="btn btn-default pull-left" href="{{ url('xem-gio-hang') }}" role="button" target="_self">
                            <i class="fa fa-arrow-left"></i> Quay lại
                        </a>
                        <button type="submit" class="btn btn-primary pull-right">
                            Tiếp tục đăng ký thử rượu <i class="fa fa-arrow-right"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <!-- InstanceEndEditable -->
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/tasting.js") }}"></script>
    <script>
        $('#dob').datepicker({
            // autoclose: true,
            format: 'yyyy:mm:dd'
        });
</script>
@endsection