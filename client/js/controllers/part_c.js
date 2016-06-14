'use strict';

app.controller("Part_C", function ($scope, $http) {
  $scope.data = {long_term: [], activity: []};

  $scope.toggle = function (item, list) {
    console.log(list);
      var idx = list.indexOf(item);
      if (idx > -1) {
        list.splice(idx, 1);
      } else {
        list.push(item);
      }
  };

  $scope.exists = function (item, list) {
    return list.indexOf(item) > -1;
  };
  $scope.enviar = function(data) {
    $http.post('http://localhost/?action=PartC/saveData', data ).then(function(res) {console.log(res);});
    $scope.next();
  };
});
