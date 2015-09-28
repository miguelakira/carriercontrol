(function(angular) {
  "use strict";
  angular.module("carriercontrol.routes", [])
  .factory("carriercontrolRoutes", function() {
    function route() {
      return Array.prototype.join.call(arguments, "/") + ".json"
    }
    return  {
      applicationsPath: function() { return "/operations/applications.json"; },
      operationsPath: function() { return "/operations.json"; },
      operationPath: function(operationId) { return route("/operations", operationId); },
      toggleOperationStatusPath: function(operationId) { return route("/operations", operationId, "toggle_status"); },
      operationsGroupsPath: function(name) {
        var url = '/operations_groups.json';
        if(name) url += '?name=' + name;
        return url;
      }
    }
  });
})(window.angular);
