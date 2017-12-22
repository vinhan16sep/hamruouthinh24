(function(){
    app.controller('MainController', function($rootScope, $scope, $http, API_URL){
        // Cookies.remove('cartProducts', {path: '/mmm'});
        $scope.storedProducts = (Cookies.get('cartProducts') != undefined) ? Cookies.get('cartProducts') : [];
        $rootScope.countAddedProducts = 0;
        if(angular.isArray(Cookies.get('cartProducts')) === true){
            $rootScope.countAddedProducts = Cookies.get('cartProducts').length;
        }else{
            if(Cookies.get('cartProducts') != undefined && Cookies.get('cartProducts').length > 0){
                $rootScope.countAddedProducts = JSON.parse(Cookies.get('cartProducts')).length;
            }else{
                $rootScope.countAddedProducts = 0;
            }
        }

        $scope.addToCart = function(id){
            $http({
                method: 'GET',
                url: API_URL + 'check_product_exist',
                params: {
                    id: id
                }
            }).then(function(response){
                var isError = false;
                if(response.data.message === 'out_of_stock'){
                    alert = $mdDialog.alert({
                        title: 'Attention',
                        textContent: 'This is an example of how easy dialogs can be!',
                        ok: 'Close'
                    });
                    $mdDialog
                        .show( alert )
                        .finally(function() {
                            alert = undefined;
                        });
                    isError = true;
                }
                // If product in discount event, get discount price. Get price otherwise
                var cost = response.data.result.is_discount == 1 ? response.data.result.discount_price : response.data.result.price;
                var arrayProduct = {
                    id: response.data.id,
                    name: response.data.result.name,
                    image: response.data.result.image,
                    quantity: 1,
                    cost: cost,
                    totalCost: cost
                };
                var storedProducts = $scope.storedProducts;

                if(!isError){
                    var isExist = false;
                    if(storedProducts.length > 0){
                        storedProducts = JSON.parse(storedProducts);
                        for(var index = 0; index < storedProducts.length; index++){
                            if(storedProducts[index].id == response.data.id){
                                isExist = true;
                            }
                        }
                        if(!isExist){
                            storedProducts.push(arrayProduct);
                        }
                    }else{
                        storedProducts.push(arrayProduct);
                    }

                    Cookies.set('cartProducts', storedProducts, { expires: 1, path: '/' });
                }

                $scope.storedProducts = Cookies.get('cartProducts');
                $rootScope.countAddedProducts = JSON.parse(Cookies.get('cartProducts')).length;

            }, function(error){

            });
        };
    });
})();