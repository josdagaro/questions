'use strict';

var app = angular.module ('Questions');

app.controller ('UserCtrl', function ($scope, $cookies) {
    console.log ("Hola a todos");
    /*$scope.limitOptions = [30, 50, 100];

    $scope.query = {
        order: '$id',
        limit: 30,
        page: 1
    };

    $scope.filter = {
        options: {
          debounce: 500
        }
    };

    $scope.edit = function (id) {console.log (id);};
    $scope.delete = function (id) {Users.delete (id);};

    $scope.editUser = function (event, user) {
        $mdDialog.show ({
          clickOutsideToClose: true,
          controller: 'editUserCtrl',
          controllerAs: 'addctrl',
          focusOnOpen: false,
          targetEvent: event,
          templateUrl: 'partials/adduser',
          locals: {user: user}
        });
    };

    $scope.addItem = function (event) {
        $mdDialog.show ({
          clickOutsideToClose: true,
          controller: 'addUserCtrl',
          controllerAs: 'addctrl',
          focusOnOpen: false,
          targetEvent: event,
          templateUrl: 'partials/adduser',
        });
    };*/
});

