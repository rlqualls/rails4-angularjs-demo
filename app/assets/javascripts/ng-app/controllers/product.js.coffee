app = angular.module('angular-demo')

app.controller('ProductCtrl', ['$scope', '$stateParams', 'Product', 'Comment', ($scope, $stateParams, Product, Comment) ->
  $scope.newComment = {}

  Product.find($stateParams.id).success( (product) ->
    $scope.product = product
  )

  $scope.removeComment = (comment) ->
    Comment.destroy(comment).success(->
      index = $scope.product.comments.indexOf(comment)
      if (index > -1)
        $scope.product.comments.splice(index, 1)
    )

  $scope.addComment = ->
    Comment.create($scope.newComment).success ( (comment) ->
      $scope.product.comments.push(comment)
    )
    
])
