describe("IndexCtrl", ->
  scope = {}
  httpBackend = {}
  beforeEach(angular.mock.module('angular-demo'))
  beforeEach(angular.mock.inject( ($rootScope, $controller, $httpBackend) ->
    scope = $rootScope.$new()
    $controller('IndexCtrl', {$scope: scope})
    httpBackend = $httpBackend
  ))

  it("should have an empty product", ->
    expect(scope.newProduct).toEqual({})
  )
)
