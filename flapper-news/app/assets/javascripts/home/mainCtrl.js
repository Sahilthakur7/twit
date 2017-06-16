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

