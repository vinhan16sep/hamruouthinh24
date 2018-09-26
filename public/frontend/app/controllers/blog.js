(function(){
    app.controller('BlogController', function($scope, $http, $location, API_URL, listAdvisesFactory, listNewsFactory){
        $scope.blogs = [];
        var type = '';

        $urlSplit = $location.path().split("/");

        // if($urlSplit[2] == 'tu-van' || $urlSplit[2] == 'tin-tuc'){
        //     type = ($urlSplit[2] == 'tu-van') ? 0 : 1;
        // }

        // if(($urlSplit[2] == 'tu-van' || $urlSplit[2] == 'tin-tuc') && $urlSplit[3] == 'danh-muc' && $urlSplit.length == 5){
        //     if($urlSplit[2] == 'tu-van'){
        //         $http({
        //             method: 'GET',
        //             url: API_URL + 'blog_category',
        //             params: {
        //                 category: $urlSplit[4]
        //             }
        //         }).then(function(success){
        //             $scope.advises = success.data;
        //         }, function(error){

        //         });
        //     }

        //     if($urlSplit[2] == 'tin-tuc'){
        //         $http({
        //             method: 'GET',
        //             url: API_URL + 'blog_category',
        //             params: {
        //                 category: $urlSplit[4]
        //             }
        //         }).then(function(success){
        //             $scope.news = success.data;
        //         }, function(error){

        //         });
        //     }
        // }

        // /**
        //  * Fetch tu-van
        //  */
        // if($urlSplit[2] == 'tu-van' && $urlSplit.length == 3){
        //     listAdvisesFactory.advises()
        //         .then(function (success) {
        //             $scope.advises = success.data;
        //         }, function (error) {

        //         });
        // }

        // /**
        //  * Fetch tin-tuc
        //  */
        // if($urlSplit[2] == 'tin-tuc' && $urlSplit.length == 3){
        //     listNewsFactory.news()
        //         .then(function (success) {
        //             $scope.news = success.data;
        //         }, function (error) {

        //         });
        // }

        /**
         * Fetch categories for each type
         */
        $http({
            method: 'GET',
            url: API_URL + 'blogs',
            params: {
                slug: $urlSplit[3]
            }
        }).then(function(success){
            console.log(success.data);
            $scope.blogs = success.data;
        }, function(error){

        });

    });
})();