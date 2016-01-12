(function(angular) {
  "use strict";

  angular.module("models.city", [])
  .factory("City", function() {
    function City(params) {
      if (!params) params = {};

      this.id = params.id;
      this.name = params.name;
      this.capital = params.capital;
    }

    City.fromJson = function(json) {
      return new City({
        id: json.id,
        name: json.name,
        capital: json.capital
      });
    };

    return City;
  });
})(window.angular);
