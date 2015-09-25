(function(angular) {
  "use strict";

  angular.module("controllers.cars", [
    "models.car",
    "services.carService"
  ])
  .controller("carsController", function(
    $scope,
    $filter,
    Car,
    carService
    ) {

    carService.list().then(function(cars) {
        $scope.cars = cars;
      });
  });
})(window.angular);