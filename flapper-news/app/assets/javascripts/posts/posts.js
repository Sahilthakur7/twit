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

