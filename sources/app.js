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
    var idx = list.indexOf(item);
    if (idx > -1) {
      list.splice(idx, 1);
    }
    else if (item == 'No Tengo') {
        $scope.limitations = [item];

      }else{
      list.push(item);
      }

  };
  $scope.exists = function (item, list) {
    return list.indexOf(item) > -1;
  };
});
