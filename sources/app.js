var app = angular.module('Questions', ['ngMaterial']);

app.controller("main", function ($scope) {
  $scope.selectedIndex = 1;
  $scope.next = function() {
      $scope.selectedIndex = Math.min($scope.selectedIndex + 1, 5) ;
    };

  $scope.previous = function() {
      $scope.selectedIndex = Math.max($scope.selectedIndex - 1, 0);
    };
});

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
    $scope.next();
  };
});

app.controller("Part_B", function ($scope) {
 $scope.nivel;
 $scope.lenguages = {
   ingles: [false, 0, 0, 0, 0],
   frances: [false, 0, 0, 0, 0],
   italiano: [false, 0, 0, 0, 0],
   portugues: [false, 0, 0, 0, 0],
   mandarin: [false, 0, 0, 0, 0],
   aleman: [false, 0, 0, 0, 0],
   japones: [false, 0, 0, 0, 0],
   arabe: [false, 0, 0, 0, 0],
 }
});
