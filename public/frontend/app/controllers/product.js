(function(){
    app.controller('ProductController', function($scope, $http, $uibModal, API_URL, $location, menuProductFactory, productsFactory){
        $scope.coverImage = '';
        $scope.menuProduct = [];
        $scope.products = [];
        $scope.targetProducts = [];
        $scope.currentTarget = '';
        $scope.currentSubTarget = '';

        $urlSplit = $location.path().split("/");
        if($urlSplit.length >= 4){
            $scope.currentTarget = $urlSplit[2];
            $scope.currentSubTarget = $urlSplit[3];
        }

        // Build menu product
        menuProductFactory.menuProduct()
            .then(function(success){
                $scope.menuProduct = success.data;
            }, function(error){

            });

        // Fetch all products
        if($urlSplit[2] == 'san-pham') {
            productsFactory.products()
                .then(function (success) {
                    $scope.products = success.data;
                }, function (error) {

                });
        }

        // Fetch products of target trademark
        if($urlSplit[2] != 'san-pham'){
            $http({
                method: 'GET',
                url: API_URL + 'target_products',
                params: {
                    target: $scope.currentTarget,
                    subTarget: $scope.currentSubTarget
                }
            }).then(
                function(success){
                    $scope.coverImage = success.data.target[0].image;
                    $scope.targetProducts = success.data.targetProducts;
                    $scope.currentTarget = success.data.type;
            }, function(error){

            });
        };

        $scope.open = function(item){
            $scope.selected = item;
            $uibModal.open({
                animation: true,
                templateUrl: 'san-pham/detail-product-modal',
                controller: 'ModalController',
                resolve: {
                    items: function(){
                        return $scope.selected;
                    }
                },
                size: 'lg'
            }).result.then(function(){}, function(res){});
        };

        $scope.openTarget = function(item){
            $scope.selected = item;
            $uibModal.open({
                animation: true,
                templateUrl: '/hamruouthinh24/san-pham/detail-product-modal',
                controller: 'ModalController',
                resolve: {
                    items: function(){
                        return $scope.selected;
                    }
                },
                size: 'lg'
            }).result.then(function(){}, function(res){});
        };

        $scope.search = function(){
            $http({
                method: 'GET',
                url: API_URL + 'search',
                params: {
                    name: $scope.name,
                    price: $scope.price,
                    origin: $scope.origin
                }
            }).then(function(success){
                $scope.products = success.data;
            }, function(error){

            });
        };

        $scope.searchTarget = function(){
            $http({
                method: 'GET',
                url: API_URL + 'search',
                params: {
                    name: $scope.name,
                    price: $scope.price,
                    target: $scope.currentTarget,
                    subTarget: $scope.currentSubTarget,
                    origin: $scope.origin
                }
            }).then(function(success){
                $scope.targetProducts = success.data;
            }, function(error){

            });
        };

        $http({
            method: 'GET',
            url: API_URL + 'origin'
        }).then(function(success){
            $scope.origins = success.data;
        }, function(error){

        });
    });
})();