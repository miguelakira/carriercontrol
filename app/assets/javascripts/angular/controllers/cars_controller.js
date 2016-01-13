(function(angular) {
  "use strict";

  angular.module("controllers.cars", [
    "models.car",
    "ui.bootstrap.modal"
  ])
  .controller("carsController", function(
    $scope,
    $filter,
    $modal
    ) {
    $scope.openModal = function() {
      $modal.open({
        animation: true,
        template: JST["angular/templates/modals/cars_modal"],
        controller: "ModalInstanceCtrl"
      });
    };
  })
  .controller('ModalInstanceCtrl', function (
    $scope,
    $modalInstance
    ) {

    $scope.ok = function () {
      $modalInstance.close();
    };

    $scope.cancel = function () {
      $modalInstance.dismiss('cancel');
    };
  });
})(window.angular);
