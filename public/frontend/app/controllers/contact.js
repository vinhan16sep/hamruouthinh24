(function(){
	app.controller('ContactController', function($scope, $http, API_URL, $location, $sce){
		$scope.$sce = $sce;
		$http({
            method: 'GET',
            url: API_URL + 'latest_news',
            params: {
                type: type,
                category_id : category_id
            }
        }).then(function(success){
            $scope.news = success.data;
            // console.log($scope.category_id);
        }, function(error){

        });
	}
})();