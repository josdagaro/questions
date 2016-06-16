'use strict';

app.controller("admin", function ($scope) {
  $scope.selectedIndex = 0;
  $scope.next = function() {
      $scope.selectedIndex = Math.min($scope.selectedIndex + 1, 5) ;
    };

  $scope.previous = function() {
      $scope.selectedIndex = Math.max($scope.selectedIndex - 1, 0);
    };
});
