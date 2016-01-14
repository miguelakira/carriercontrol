(function(angular) {
  "use strict";

  angular.module("services.car", [])

  .factory("carService", function(
    $http,
    $q
  ) {
    return {
      find: function(plate) {
        return $http.get("/cars/find_by_plate/" + plate).then(function(response) {
          return !!response.data;
        });
      }
    };
  });

})(window.angular);
