(function(){
    app.controller('DetailBlogController', function($scope, $http, API_URL, $location, $sce){
        $scope.$sce = $sce;
        $scope.selected = [];
        $scope.news = [];
        var comment;
        var type = '';
        $urlSplit = $location.path().split("/");
        if(($urlSplit[2] == 'tu-van' || $urlSplit[2] == 'tin-tuc') && $urlSplit.length >= 4){
            var slug = $urlSplit[3];
            $scope.slug = slug;

        }

        if($urlSplit[2] == 'tu-van' || $urlSplit[2] == 'tin-tuc'){
            type = ($urlSplit[2] == 'tu-van') ? 0 : 1;
            title = ($urlSplit[2] == 'tu-van') ? 'tư vấn' : 'tin tức';
            $scope.title = title;
            $scope.type = type;
        }

        $http({
            method: 'GET',
            url: API_URL + 'detail',
            params: {
                slug: slug
            }
        }).then(function(success){
            $scope.selected = success.data[0];
            // console.log($scope.selected);
            blog_id = $scope.selected.id;
            $http({
                method: 'GET',
                url: API_URL + 'get_blog_comment',
                params: {
                    id: blog_id
                }
            }).then(
                function(res){
                    $scope.blogComments = res.data.data;
                    console.log(res.data.data);
                }, function(error){

            });
        }, function(error){

        });

        $http({
            method: 'GET',
            url: API_URL + 'latest_news',
            params: {
                type: type
            }
        }).then(function(success){
            $scope.news = success.data;
        }, function(error){

        });

        $http({
            method: 'GET',
            url: API_URL + 'latest_advises',
            params: {
                type: type
            }
        }).then(function(success){
            $scope.advises = success.data;
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

        /**
         * comment blog
         */
        
        $scope.save = function(id){
            var url = 'http://localhost/hamruouthinh24/';
            $("#sendComment").prop('disabled', true);
            $http({
                method: 'GET',
                url: API_URL + 'add_blog_comment',
                params: {
                    blog_id: id,
                    author: $scope.author,
                    email: $scope.email,
                    content: $scope.content
                }
            }).then(function(success){
                // $("#sendComment").prop('disabled', false);
                $('#inputMessage').val('');
                $scope.comment = success.data;
                var bindComment = '<div class="media first-comment" ng-repeat="comments in blogComments">';
                bindComment += '<div class="media-left">';
                bindComment += '<img class="media-object" src="'+url+'public/frontend/img/users_ava.png" alt="users_ava">';
                bindComment += '</div>';
                bindComment += '<div class="media-body">';
                bindComment += '<h4 class="media-heading">'+$scope.author+'</h4>';
                bindComment += '<p>'+$scope.content+'</p>';
                bindComment += '</div>';
                bindComment += '</div>';
                $('.first-comment:first-child').before(bindComment);
                // console.log(blog_id);
            }, function(error){

            });
        };

        

    });
})();