(function(angular) {
  "use strict";

  angular.module("controllers.editCars", [
    "services.car",
    "services.location",
    "services.client",
    "models.car",
    "models.client",
    "models.freight",
    "models.location",
    "models.state"
  ])
  .controller("editCarsController", function(
    $scope,
    $filter,
    carService,
    clientService,
    locationService,
    Car,
    Client,
    Freight,
    Location,
    State,
    carJson,
    clientJson,
    freightJson,
    locationJson,
    statesJson
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

        $scope.car = Car.fromJson(carJson);
        $scope.client = Client.fromJson(clientJson);
        $scope.freight = Freight.fromJson(freightJson);
      };

      $scope.checkPlate = function(plate) {
        carService.find({plate: "ADE-23212"}).then(function(response) { console.log(response)});
      }

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
