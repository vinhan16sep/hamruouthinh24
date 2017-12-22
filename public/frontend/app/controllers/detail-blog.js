(function(){
    app.controller('DetailBlogController', function($scope, $http, API_URL, $location, $sce){
        $scope.$sce = $sce;
        $scope.selected = [];
        var type = '';

        $urlSplit = $location.path().split("/");
        if(($urlSplit[2] == 'tu-van' || $urlSplit[2] == 'tin-tuc') && $urlSplit.length >= 4){
            var slug = $urlSplit[3];
        }

        if($urlSplit[2] == 'tu-van' || $urlSplit[2] == 'tin-tuc'){
            type = ($urlSplit[2] == 'tu-van') ? 0 : 1;
        }

        $http({
            method: 'GET',
            url: API_URL + 'detail',
            params: {
                slug: slug
            }
        }).then(function(success){
            $scope.selected = success.data[0];
        }, function(error){

        });

        /**
         * Fetch categories for each type
         */
        $http({
            method: 'GET',
            url: API_URL + 'category',
            params: {
                type: type
            }
        }).then(function(success){
            $scope.categories = success.data;
        }, function(error){

        });
    });
})();