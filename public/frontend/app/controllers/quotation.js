(function(){
	app.controller('QuotationController', function($scope, $http, API_URL, $location, $sce){
		$scope.$sce = $sce;
        $('.btn-quotation').click(function(){
            $('.btn-quotation').prop('disabled', true);
        });
		$scope.send = function(quotation) {
            
            $http({
                method: 'GET',
                url: API_URL + 'sendMailQuotation',
                params: {
                    name : quotation.name, email: quotation.email, phone : quotation.phone
                }
            }).then(function(success){
                alert('Đăng ký thành công!');
                $('.btn-quotation').prop('disabled', false);
            }, function(error){

            });
        };
	});
})();