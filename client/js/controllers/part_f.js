'use strict';

app.controller("Part_F", function ($scope, $http) {
  $scope.data = {full_name: "", relationship: "", contry: "", departament: "", city: "", res_phone: "", mob_phone: ""};
  $scope.enviar = function(data) {
    $http.post('http://localhost/?action=PartF/saveData', data).then(function(res) {console.log(res);});
    $scope.next();
  };
});
