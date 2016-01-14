(function(angular) {
  "use strict";

  angular.module("services.client", [
  ])

  .factory("clientService", function(
    $http,
    $q
  ) {
    return {
      find: function(client) {
        var path = client.cpf? "cpf=" + client.cpf : "cnpj=" + client.cnpj;

        return $http.get("/clients/find_by_document?" + path).then(function(response) {
          return response.data
        });
      }
    };
  });

})(window.angular);
