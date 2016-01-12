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
      $scope.selectedCity = null;
      $scope.states = statesJson.map(State.fromJson);
      $scope.selectedState = $scope.states[0];

      $scope.update = function(stateId) {
        locationService.listCities(stateId).then(function(cities) {
          $scope.cities = cities;
        });
      };
  });
})(window.angular);
