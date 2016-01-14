(function(angular) {
  "use strict";

  angular.module("models.freight", [])

  .factory("Freight", function() {
    function Freight(params) {
      if (!params) params = {};

      this.subtotal = params.subtotal;
      this.ferry = params.ferry;
      this.platform = params.platform;
      this.redispatching = params.redispatching;
      this.platformOrigin = params.platformOrigin;
      this.platformDestination = params.platformDestination;
      this.discount = params.discount;
      this.observation = params.observation;
    }

    Freight.fromJson = function(json) {
      return new Freight({
        subtotal: json.subtotal,
        ferry: json.ferry,
        platform: json.platform,
        redispatching: json.redispatching,
        platformOrigin: json.plaform_origin,
        platformDestination: json.platform_destination,
        discount: json.discount,
        observation: json.observation
      });
    };

    return Freight;
  });
})(window.angular);
