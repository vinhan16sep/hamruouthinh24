(function(){
	app.controller('ContactController', function($scope, $http, API_URL, $location, $sce){
		$scope.$sce = $sce;
		$scope.send = function(contact) {
            console.log(contact);
            $http({
                method: 'GET',
                url: API_URL + 'sendmail',
                params: {
                    name : contact.name, email: contact.email, phone : contact.phone, reason : contact.reason, content : contact.content
                }
            }).then(function(success){
                // if(success.data.message == 'success'){
                //     alert('Đăng ký thành công!');
                //     $('#subs_email').val('');
                // }else{
                //     alert('Đăng ký thất bại. Email này đã tồn tại!');
                // }
            }, function(error){

            });
        };
	});
})();