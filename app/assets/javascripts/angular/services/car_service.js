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
      save: function(car) {
        var promise = car.id ?
          $http.put(carriercontrolRoutes.carPath(car.id), car.toJson()) :
          $http.post(carriercontrolRoutes.carsPath(), car.toJson());

        return promise.then(function(response) {
          var savedCar = car.fromJson(response.data);
          if(car.id) {
            var i = cars.findIndex(function(o) {
              return o.id == car.id;
            });
            cars[i] = savedCar;
          } else {
            cars.unshift(savedCar);
          }
          return savedCar;
        }, function(response){
          return $q.reject(response.data.errors);
        });
      },
      list: function() {
        return $q.resolve(carsJson.map(Car.fromJson));
      },

      getAll: function() {
        var promise = $http.get("/cars.json")
        return promise.then(function(response) {
          angular.copy(response.data, cars);
        });
      }
    };
  });

})(window.angular);
