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
        return $http.get("/cities/" + stateId).then(function(response) {
          return $q.resolve(response.data.map(City.fromJson));
        });
      }
    };
  });

})(window.angular);
