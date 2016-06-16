'use strict';

app.controller("Part_A", function($scope, $http){
  $scope.data = {civil_state:'', housing: '', children_num: '', performans:'', limitations: []}

  $scope.housingOptions = ('En arriendo,Propia y la está pagando,Propia totalmente pagada,De un familiar sin pagar arriendo,De un tercero sin pagar arriendo,Otra').split(',').map(function (option) { return  option });

  $scope.limitationsOptions = ('Moverse o caminar,Usar sus brazos y manos,Ver a pesar de usar lentes o gafas,Oír aún con aparatos especiales,Hablar,Entender o aprender,Relacionarse con los demás por problemas mentales o emocionales,Otra limitación permanente').split(',').map(function (option) { return  option });

  $scope.toggle = function (item, list) {
    var not_have = $scope.exists(0, $scope.data.limitations)
    if(!not_have){
      var idx = list.indexOf(item);
      if (idx > -1) {
        list.splice(idx, 1);
        if ($scope.data.performans == item) {
          $scope.data.performans = "";
        }
      } else if (item == 0) {
        $scope.data.limitations = [item];
      } else {
        list.push(item);
      }
    }else if (not_have && item == 0) {
      $scope.data.limitations = [];
    }
  };

  $scope.exists = function (item, list) {
    return list.indexOf(item) > -1;
  };


  $scope.on_performans = function() {
    return !$scope.exists(0, $scope.data.limitations) && $scope.data.limitations.length > 0;
  };

  $scope.enviar = function (data) {
    $http.post('http://localhost/?action=PartA/saveData', data ).then(function(res) {console.log(res);});
    $scope.next();
  };
});


app.controller("admin_Part_A", function($scope, $http){
  $scope.labels1 = ["Soltero(a)", "Casado / Union Libre"];
  $scope.labels3=  ['En arriendo,Propia y la está pagando', 'Propia totalmente pagada', 'De un familiar sin pagar arriendo', 'De un tercero sin pagar arriendo', 'Otra'];
  $scope.labels5 = ['Ninguna','Moverse o caminar', 'Usar sus brazos y manos', 'Ver a pesar de usar lentes o gafas', 'Oír aún con aparatos especiales', 'Hablar', 'Entender o aprender', 'Relacionarse con los demás por problemas mentales o emocionales', 'Otra limitación permanente'];
  $http.post('http://localhost/?action=PartA/loadData').then(function(res) {
    var data = res.data.dataset;
    var counter = {'1':[0,0], '3':[0,0,0,0,0,0], '5':[0,0,0,0,0,0,0,0,0]};
    for (var j in data) {
      counter[1][data[j][1]-1] += 1;
      counter[3][data[j][3]-1] += 1;
      counter[5][data[j][5]] += 1;
    }
    console.log(counter[3]);
    $scope.data1 = counter[1];
    $scope.data3 = counter[3];
    $scope.data5 = counter[5];
  });

});
