(function(angular) {
  "use strict";

  angular.module("controllers.editCars", ["models.state", "services.location"])
  .controller("editCarsController", function(
    $scope,
    $filter,
    State,
    statesJson,
    locationService
    ) {
      $scope.states = statesJson.map(State.fromJson);

      $scope.update = function(location, stateId) {

        switch(location) {
        case "origin":
          locationService.listCities(stateId).then(function(cities) { $scope.originCities = cities });
          break;
        case "destination":
          locationService.listCities(stateId).then(function(cities) { $scope.destinationCities = cities });
          break;
        case "current":
          locationService.listCities(stateId).then(function(cities) { $scope.currentCities = cities });
          break;
        }
      };
  });
})(window.angular);
