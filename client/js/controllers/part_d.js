'use strict';

app.controller("Part_D", function ($scope, $http) {
  // Part 1
  $scope.data1 = {more_time_activity: 0,remunerated_activity: 0, diligence_work: 0, after_dilig_work: 0, reasons_not_dilig: 0, work_availab: 0, activity_role: 0};

  // Part 2
  $scope.data2 = {first_work: 0, search_ch: 0, type_link: 0, current_occup: 0, eco_activity: 0, employment_relat: 0, last_entry: 0, week_work_hours_avg: 0, field_activity: 0, inst_links: 0};

  // Part 3
  $scope.data3 = { first_work: 0, career_relat: 0, labour_forms: 0, eco_activity_alumn: 0, monthly_income: 0};

  // Part 4
  $scope.data4 = {create_company: 0, main_difficulty: 0};

  // Part 5
  $scope.data5 = {time_company: 0, career_relat: 0, eco_activity_company: 0, company_monthly_avg: 0};

  // Part 6
  $scope.data6 = {exp_months: 0, study_exp_reality: 0, useful_knowledge: {work:0, life:0}, work_contributes: 0, work_satisfaction: 0, study_level: 0, additional_interest: 0, other_work: 0, should_earn_more: 0};

  // Part 7
  $scope.data7 = {looking_first_job: 0, months_looking_job: 0, get_job: 0, difficult_get_job: 0, search_ch_job: 0};

  $scope.enviar = function(data1,data2,data3,data4,data5,data6,data7) {
    $http.post('http://localhost/?action=PartDOne/saveData', data1 ).then(function(res) {console.log(res);});
    $http.post('http://localhost/?action=PartDTwo/saveData', data2 ).then(function(res) {console.log(res);});
    $http.post('http://localhost/?action=PartDThree/saveData', data3 ).then(function(res) {console.log(res);});
    $http.post('http://localhost/?action=PartDFour/saveData', data4 ).then(function(res) {console.log(res);});
    $http.post('http://localhost/?action=PartDFive/saveData', data5 ).then(function(res) {console.log(res);});
    $http.post('http://localhost/?action=PartDSix/saveData', data6 ).then(function(res) {console.log(res);});
    http.post('http://localhost/?action=PartDSeven/saveData', data7 ).then(function(res) {console.log(res);});
    $scope.next();
  };
});
