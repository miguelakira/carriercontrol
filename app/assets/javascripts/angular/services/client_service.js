(function(angular) {
  "use strict";

  angular.module("services.client", ["models.client"])
  .factory("clientService", function(
    $http,
    $q,
    Client
  ) {
    return {
      find: function(client) {
        var path = client.cpf? "cpf=" + client.cpf : "cnpj=" + client.cnpj;

        return $http.get("/clients/find_by_document?" + path).then(function(response) {
          return Client.fromJson(response.data);
        });
      }
    };
  });

})(window.angular);
