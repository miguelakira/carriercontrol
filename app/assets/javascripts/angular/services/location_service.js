(function(angular) {
  "use strict";

  angular.module("services.location", [
    "models.city"
  ])

  .factory("locationService", function(
    $http,
    $q,
    City
  ) {
    return {
      listCities: function(stateId) {
        var promise = $http.get("/cities/" + stateId)
        return promise.then(function(response) {
          return $q.resolve(response.data.map(City.fromJson));
        });
      }
    };
  });

})(window.angular);
