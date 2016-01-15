(function(angular) {
  "use strict";

  angular.module("controllers.cars", [
  ])
  .controller("carsController", function(
    $scope,
    carsJson
    ) {
    console.log(carsJson);
  });
})(window.angular);
