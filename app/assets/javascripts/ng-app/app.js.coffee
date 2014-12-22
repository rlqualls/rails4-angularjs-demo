app = angular.module('angular-demo', ['ngAnimate', 'ui.router', 'templates'])

app.config(['$httpProvider', '$stateProvider', '$urlRouterProvider', '$locationProvider', ($httpProvider, $stateProvider, $urlRouterProvider, $locationProvider) ->
  $stateProvider.state('home', {
    url: '/',
    templateUrl: 'index.html',
    controller: 'IndexCtrl'
  })

  $stateProvider.state('products', {
    url: '/products/:id',
    templateUrl: 'product.html',
    controller: 'ProductCtrl'
  })

  $urlRouterProvider.otherwise('/')
  $locationProvider.html5Mode(true)

  # Set CSRF token
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

  # Make API requests end in '.json'
  $httpProvider.interceptors.push( ($q) ->
    {
      request: (config) ->
        apiRegex = /^\/api/
        if apiRegex.test(config.url)
          config.url += '.json'
          return config
        else
          return $q.when(config)
    }
  )
])
