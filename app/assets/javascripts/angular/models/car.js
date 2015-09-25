(function(angular) {
  "use strict";

  angular.module("models.car", [
    "models.buyer"
    ])
  .factory("Car", function() {
    function Car(params) {
      if (!params) params = {};

      this.id = params.id;
      this.plate = params.plate;
      this.model = params.model;
      this.buyer = params.buyer ? params.buyer : null;
    }

    Car.prototype.toJson = function() {
      return {
        car: {
          name: this.name ? this.name : null,
          plate: this.plate ? this.plate : null,
          model: this.model ? this.model : null
        }
      };
    };

    Car.prototype.fromJson = function(json) {
      return new Car({
        id: json.id,
        name: json.name,
        model: json.model,
        buyer: json.buyer ? Buyer.fromJson(json.buyer) : null
      });
    };

    return Car;
  });
})(window.angular);