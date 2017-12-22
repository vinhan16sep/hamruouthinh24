(function(){
    app.controller('DetailProductController', function($scope, $http, API_URL, $uibModal, $location, $sce, menuProductFactory){
        $scope.$sce = $sce;
        $scope.menuProduct = [];
        $scope.detail = [];
        $scope.targetProducts = [];

        $urlSplit = $location.path().split("/");

        // Build menu product
        menuProductFactory.menuProduct()
            .then(function(success){
                $scope.menuProduct = success.data;
            }, function(error){

            });

        // Fetch product information
        $http({
            method: 'GET',
            url: API_URL + 'detail_product',
            params: {
                slug: $urlSplit[4]
            }
        }).then(
            function(success){
                $scope.detail = success.data[0];
                console.log($scope.detail);

                $http({
                    method: 'GET',
                    url: API_URL + 'target_products',
                    params: {
                        target: 'danh-muc',
                        subTarget: $scope.detail.category_slug
                    }
                }).then(
                    function(success){
                        $scope.targetProducts = success.data.targetProducts;
                    }, function(error){

                    });
            }, function(error){

        });

        $scope.open = function(item){
            $scope.selected = item;
            $uibModal.open({
                animation: true,
                templateUrl: '/mmm/san-pham/detail-product-modal',
                controller: 'ModalController',
                resolve: {
                    items: function(){
                        return $scope.selected;
                    }
                },
                size: 'lg'
            }).result.then(function(){}, function(res){});
        };

    });
})();