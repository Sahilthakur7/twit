
angular.module('flapperNews')
.factory('posts', [ '$http',function($http)
        {
            var o= {
                posts: [{title: 'post 1',upvotes: 5},
 
{title: 'post 2',upvotes: 7,comments: []},

{title: 'go',upvotes: 5,comments: []},

{title: 'post 4',upvotes: 3, comments: [ {author: 'raju', body: 'hello', upvotes: 3} ]},

{title: 'post 5',upvotes: 4, comments: [ {author: 'raj', body: 'hom', upvotes: 4} ]}]
            };
            o.getAll = function(){
                return $http.get('/posts.json').then(function(data){
                    angular.copy(data,o.posts);
                });
            };
            o.create = function(post){
                return $http.post('/posts.json', post).then(function(data){
                    o.posts.push(data);
                });
            };
            return o;
        }]);
