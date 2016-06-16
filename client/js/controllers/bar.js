'user strict';

app.controller('Bar', function ($scope, Auth) {
  $scope.logout = function () {
    Auth.logout();
  };
});
