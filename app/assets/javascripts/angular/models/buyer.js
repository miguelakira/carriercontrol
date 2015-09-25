(function(angular) {
  "use strict";

  angular.module("models.buyer", [])

  .factory("Buyer", function() {
    function Buyer(params) {
      if (!params) params = {};

      this.id = params.id;
      this.name = params.name;
      this.cpf = params.cpf ? params.cpf : null;
      this.cnpj = params.cnpj ? params.cnpj : null;
    }

    Buyer.fromJson = function(json) {
      return new Buyer({
        id: json.id,
        name: json.name,
        cpf: json.cpf ? json.cpf : null,
        cnpj: json.cnpj ? json.cnpj : null
      });
    };

    return Buyer;
  });
})(window.angular);
