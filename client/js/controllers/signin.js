'use strict';

app.controller('signin', function ($scope, Auth) {
  $scope.data = {user: '', pin:''};
  $scope.signin = function(data){
    $scope.data = {user: '', pin:''};
    Auth.login(data);
  };
});
