angular.module('flapperNews', ['ui.router', 'templates'])
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider){
$stateProvider
    .state('home', {
        url:'/home',
        templateUrl: 'home/_home.html',
        controller: 'MainCtrl'
    })
    .state('posts', {
        url: '/posts/{id}' , 
        templateUrl: 'posts/_posts.html',
        controller: 'PostsCtrl'
});
    $urlRouterProvider.otherwise('home');
}
])
.factory('posts', [function()
        {
            var o= {
                posts: [{title: 'post 1',upvotes: 5},
 
{title: 'post 2',upvotes: 7},

{title: 'post 3',upvotes: 5},

{title: 'post 4',upvotes: 3, comments: [ {author: 'raju', body: 'hello', upvotes: 3} ]},

{title: 'post 5',upvotes: 4, comments: [ {author: 'raj', body: 'hom', upvotes: 4} ]}]
            };
            return o;
        }])
.controller('MainCtrl', [
'$scope', 'posts',
function($scope,posts){
    $scope.posts = posts.posts;
    $scope.test = 'Manchester United';
    
 $scope.addPost = function() {
    if(!$scope.title || $scope.title === '') { return; }
    $scope.posts.push({title: $scope.title, upvotes: 0 , link: $scope.link, comments: [
    {author: 'Sahil', body: 'Cool post', upvotes: 3},
    {author: 'KV', body: 'Hola', upvotes: 1}
    ]});
    $scope.title = '';
    $scope.link = '';
};   
$scope.incrementUpvotes = function(post) {
    post.upvotes += 1;
} 
    
}
])
.controller('PostsCtrl', [
'$scope',
'$stateParams',
'posts',
function($scope,$stateParams,posts){
$scope.post = posts.posts[$stateParams.id];
$scope.no = $stateParams.id;
$scope.hello = "Man utd";

$scope.addComment = function() {
if($scope.body === '') { return; }
$scope.post.comments.push( {
    body: $scope.body,
    author: 'user',
    upvotes: 0
} );
$scope.body = '';
};
$scope.incrementUpvotes = function(comment) {
comment.upvotes +=1;
}


}
]);


