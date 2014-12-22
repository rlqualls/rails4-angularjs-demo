app = angular.module("angular-demo")

app.service "Comment", ['$http', ($http) ->
    urlBase = '/api/v1/comments'

    all = ->
      $http.get(urlBase)

    find = (id) ->
      $http.get(urlBase + '/' + id)

    create = (comment) ->
      $http.post(urlBase, comment)

    update = (comment) ->
      $http.put(urlBase + '/' + comment.id, comment)

    destroy = (comment) ->
      $http.delete(urlBase + '/' + comment.id)

    {
      all: all
      find: find
      create: create
      update: update
      destroy: destroy
      delete: destroy
    }
  ]
