@extends('layouts.frontend-template')
@section('content')
    <section id="contact">
        <div class="main_content" ng-controller="ContactController">
            <div class="container">
                <div class="row">
                    <div class="contact-navside col-md-4 col-sm-4 col-xs-12">
                        <div class="content-title">
                            <h2>Liên hệ với chúng tôi</h2>
                        </div>
                        <address>
                            <strong>{!!$contact->company!!}</strong>
                            <br>
                            Địa chỉ: {!!$contact->address!!}
                            <br>
                            Điện thoại: {!!$contact->numberphone!!}
                            <br>
                            Email: {!!$contact->email!!}
                            <br>
                            Website: {!!$contact->website!!}
                        </address>

                        <div class="content-title">
                            <h2>Liên hệ với chúng tôi</h2>
                        </div>
                        <form>
                            <div class="contact-form">
                                <label for="inputName">Họ tên (*)</label>
                                <input type="type" class="form-control" id="inputName" placeholder="Họ tên" ng-model="contact.name">
                                <br>
                                <label for="inputEmail">Email (*)</label>
                                <input type="email" class="form-control" id="inputEmail" placeholder="Email" ng-model="contact.email">
                                <br>
                                <label for="inputPhone">Số điện thoại (*)</label>
                                <input type="type" class="form-control" id="inputPhone" placeholder="Số điện thoại" ng-model="contact.phone">
                                <br>
                                <label for="inputPhone">Lý do bạn đang cần liên hệ</label>
                                <select class="form-control" id="inputReason" ng-model="contact.reason">
                                    <option>Bạn đang cần liên hệ với chúng tôi vì...</option>
                                    <option>Tôi đang cần tư vấn làm đẹp</option>
                                    <option>Tôi đang cần tư vấn về sản phẩm</option>
                                    <option>Tôi muốn tìm hiểu về ABC</option>
                                    <option>Tôi muốn tìm hiểu về DEF</option>
                                </select>
                                <br>
                                <textarea class="form-control" rows="4" placeholder="Tin nhắn..." ng-model="contact.content"></textarea>
                                <br>
                                <input type="submit" ng-click="send(contact)" class="btn btn-default btn-contact" value="Gửi đi" />
                            </div>
                        </form>
                    </div>

                    <div class="col-md-8 col-sm-8 col-xs-12" id="map-contact">
                        {!!$contact->map!!}
                    </div>
                </div>
            </div>
            <!-- InstanceEndEditable -->
        </div>
    </section>
    <script src="{{ asset ("public/frontend/app/controllers/contact.js") }}"></script>
@endsection