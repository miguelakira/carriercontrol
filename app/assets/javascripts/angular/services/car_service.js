(function(angular) {
  "use strict";

  angular.module("services.carService", [
    "models.car"
  ])

  .factory("carService", function(
    $http,
    $q,
    Car,
    carsJson
  ) {
    var cars = carsJson.map(Car.fromJson);
    return {
      list: function() {
        return $q.resolve(carsJson.map(Car.fromJson));
      }
    }
  });

})(window.angular);
