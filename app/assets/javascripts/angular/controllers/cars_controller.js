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

    $scope.editCar = function(car) {
      console.log(car);
    }
  });
})(window.angular);