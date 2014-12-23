app = angular.module('angular-demo')

app.controller('IndexCtrl', ($scope, $state, Product) ->
  $scope.newProduct = {}

  Product.all().success( (products) ->
    $scope.products = products
  )

  $scope.addProduct = ->
    Product.create($scope.newProduct).success( (product) ->
      $scope.products.push(product)
      $scope.newProduct = {}
      $scope.productForm.$setPristine(true)
    )

  $scope.removeProduct = (product) ->
    Product.destroy(product).success(->
      index = $scope.products.indexOf(product)
      if (index > -1)
        $scope.products.splice(index, 1)
    )
)
