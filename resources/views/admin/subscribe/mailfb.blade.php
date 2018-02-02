<html>
@if($name)
Họ tên: {{ $name }} <br>
@endif

@if($email)
Email: {{ $email }} <br>
@endif

@if($phone)
Phone: {{ $phone }} <br>
@endif

@if($reason)
Vấn đề cần tư vấn: {{ $reason }} <br>
@endif

@if($content)
Nội dung: {{ $content }} <br>
@endif
</html>