var app = angular.module('Questions', ['ngMaterial']);

app.controller("Part_A", function($scope){
  $scope.civil_state = "";
  $scope.children_num;

  $scope.housing = "";
  $scope.housingOptions = ('En arriendo,Propia y la está pagando,Propia totalmente pagada,De un familiar sin pagar arriendo,De un tercero sin pagar arriendo,Otra').split(',').map(function (option) { return  option });

  $scope.limitations = [];
  $scope.performans = "";
  $scope.limitationsOptions = ('Moverse o caminar,Usar sus brazos y manos,Ver a pesar de usar lentes o gafas,Oír aún con aparatos especiales,Hablar,Entender o aprender,Relacionarse con los demás por problemas mentales o emocionales,Otra limitación permanente').split(',').map(function (option) { return  option });

  $scope.toggle = function (item, list) {
    var not_have = $scope.exists('No Tengo', $scope.limitations)
    if(!not_have){
      var idx = list.indexOf(item);
      if (idx > -1) {
        list.splice(idx, 1);
        if ($scope.performans == item) {
          console.log('debe ponerse blanco');
          $scope.performans = "";
        }
      } else if (item == 'No Tengo') {
        $scope.limitations = [item];
      } else {
        list.push(item);
      }
    }else if (not_have && item == 'No Tengo') {
      $scope.limitations = [];
    }
  };

  $scope.exists = function (item, list) {
    return list.indexOf(item) > -1;
  };


  $scope.on_performans = function() {
    return !$scope.exists('No Tengo', $scope.limitations) && $scope.limitations.length > 0;
  };

  $scope.enviar = function() {
    alert('Soy famoso');
  };
});
