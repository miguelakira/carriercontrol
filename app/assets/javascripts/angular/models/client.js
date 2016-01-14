(function(angular) {
  "use strict";

  angular.module("models.client", [])

  .factory("Client", function() {
    function Client(params) {
      if (!params) params = {};

      this.id = params.id;
      this.name = params.name;
      if (params.cpf) this.cpf = params.cpf;
      if (params.cnpj) this.cnpj = params.cnpj;
      this.phone = params.phone;
      this.cellphone = params.cellphone;
      this.observation = params.observation;
      this.email = params.email;
    }

    Client.fromJson = function(json) {
      return new Client({
        id: json.id,
        name: json.name,
        cpf: json.cpf ? json.cpf : null,
        cnpj: json.cnpj ? json.cnpj : null,
        phone: json.phone,
        cellphone: json.cellphone,
        observation: json.observation,
        email: json.email
      });
    };

    return Client;
  });
})(window.angular);
