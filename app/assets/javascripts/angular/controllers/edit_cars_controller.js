(function(angular) {
  "use strict";

  angular.module("controllers.editCars", ["models.state"])
  .controller("editCarsController", function(
    $scope,
    $filter,
    State,
    statesJson
    ) {
      $scope.states = statesJson.map(State.fromJson);
      $scope.selectedState = $scope.states[0];
      console.log($scope.selectedState)
  });
})(window.angular);
