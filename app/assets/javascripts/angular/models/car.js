(function(angular) {
  "use strict";

  angular.module("models.car", [
    "models.buyer"
    ])
  .factory("Car", function() {
    function Car(params) {
      if (!params) params = {};
      this.plate = params.plate;
      this.purchaseDate = params.purchaseDate;
      this.expectedEndDate = params.expectedEndDate;
    }

    Car.fromJson = function(json) {
      return new Car({
        plate: json.plate,
        purchaseDate: json.purchase_date,
        expectedEndDate: json.expected_end_date
      });
    };

    return Car;
  });
})(window.angular);
