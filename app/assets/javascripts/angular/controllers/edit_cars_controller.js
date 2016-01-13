(function(angular) {
  "use strict";

  angular.module("controllers.editCars", ["models.state", "models.location", "services.location"])
  .controller("editCarsController", function(
    $scope,
    $filter,
    State,
    statesJson,
    Location,
    locationJson,
    locationService
    ) {
      $scope.init = function() {
        var location = Location.fromJson(locationJson);

        $scope.origin = location.origin;
        $scope.destination = location.destination;
        $scope.current = location.current;
        $scope.originState = location.originState;
        $scope.destinationState = location.destinationState;
        $scope.currentState = location.currentState;

        $scope.states = statesJson.map(State.fromJson);

        $scope.update("origin");
        $scope.update("destination");
        $scope.update("current");
      };

      $scope.update = function(location) {
        switch(location) {
        case "origin":
          locationService.listCities($scope.originState.id).then(function(cities) { $scope.originCities = cities });
          break;
        case "destination":
          locationService.listCities($scope.destinationState.id).then(function(cities) { $scope.destinationCities = cities });
          break;
        case "current":
          locationService.listCities($scope.currentState.id).then(function(cities) { $scope.currentCities = cities });
          break;
        }
      };

      $scope.init();
  });
})(window.angular);
