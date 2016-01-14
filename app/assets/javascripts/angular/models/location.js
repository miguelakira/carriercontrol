(function(angular) {
  "use strict";

  angular.module("models.location", [
    "models.location"
    ])
  .factory("Location", function() {
    function Location(params) {
      if (!params) params = {};

      this.origin = {id: params.originId};
      this.destination = {id: params.destinationId};
      this.current = {id: params.currentId};
      this.originState = {id: params.originStateId};
      this.destinationState = {id: params.destinationStateId};
      this.currentState = {id: params.currentStateId};
    }

    Location.fromJson = function(json) {
      return new Location({
        originId: json.origin_id,
        destinationId: json.destination_id,
        currentId: json.current_id,
        originStateId: json.origin_state ? json.origin_state.id : null,
        destinationStateId: json.destination_state ? json.destination_state.id : null,
        currentStateId: json.current_state ? json.current_state.id : null
      });
    }

    return Location;
  });
})(window.angular);
