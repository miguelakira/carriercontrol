(function(angular) {
  "use strict";

  angular.module("models.state", [
    "models.state"
    ])
  .factory("State", function() {
    function State(params) {
      if (!params) params = {};

      this.id = params.id;
      this.name = params.name;
      this.acronym = params.acronym;
    }

    State.prototype.toJson = function() {
      return {
        state: {
          name: this.name ? this.name : null,
          acronym: this.acronym ? this.acronym : null,
        }
      };
    };

    State.prototype.fromJson = function(json) {
      return new State({
        id: json.id,
        name: json.name,
        acronym: json.acronym
      });
    };

    return State;
  });
})(window.angular);
