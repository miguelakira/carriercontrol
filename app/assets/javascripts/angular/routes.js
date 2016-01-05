(function(angular) {
  "use strict";
  angular.module("carriercontrol.routes", [])
  .factory("carriercontrolRoutes", function() {
    function route() {
      return Array.prototype.join.call(arguments, "/") + ".json"
    }
    return  {
      carsPath: function() { return "/operations.json"; },
      carPath: function(carId) { return route("/cars", carId); }
    }
  });
})(window.angular);
