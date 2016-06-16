'use strict';

app.controller("Part_E", function ($scope, $http) {
  $scope.data = {classify_sense_belong: 0, eval_work_possib: 0, study_again: 0, reason_study_again: 0, reason_no_study_again: 0, want_other_study: 0, other_study: 0, recommend: 0};
  $scope.enviar = function(data) {
    $http.post('http://localhost/?action=PartE/saveData', data).then(function(res) {console.log(res);});
    $scope.next();
  };
});
