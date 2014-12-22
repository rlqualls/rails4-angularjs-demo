app = angular.module("angular-demo")

app.service "Product", ['$http', ($http) ->
    urlBase = '/api/v1/products'

    all = ->
      $http.get(urlBase)

    find = (id) ->
      $http.get(urlBase + '/' + id)

    create = (product) ->
      $http.post(urlBase, product)

    update = (product) ->
      $http.put(urlBase + '/' + product.id, product)

    destroy = (product) ->
      $http.delete(urlBase + '/' + product.id)

    comments = (id) ->
      $http.get(urlBase + '/' + id + '/comments')

    {
      all: all
      find: find
      create: create
      update: update
      destroy: destroy
      delete: destroy
      comments: comments
    }
  ]
