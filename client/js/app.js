(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
'use strict';

var app = angular.module('Questions', ['ngMaterial', 'ngRoute', 'ngCookies']);

app.config(function ($routeProvider) {
  $routeProvider.when('/', {
    controller: 'main',
    templateUrl: "questions.html",
    auth: 'graduate'
  }).when('/admin', {
    controller: 'admin',
    templateUrl: "admin.html",
    auth: 'admin'
  }).when('/signin', {
    controller: 'signin',
    templateUrl: 'signin.html'
  });
});

app.run(function ($rootScope, $location, Auth) {
  $rootScope.$on("$routeChangeStart", function (evt, to, from) {
    if (Auth.is_login()) {} else {
      $location.path('/signin');
    }
  });
});

app.service('Auth', function ($http) {
  this.login = function (data) {
    $http.post('http://localhost/questions/?action=Graduate/sigin', data).then(function (res) {
      console.log(res);
    });
  };
  this.is_login = function () {
    return false;
  };
});

app.controller('signin', function ($scope, Auth) {
  $scope.data = { user: '', pass: '' };
  $scope.signin = function (data) {
    $scope.data = { user: '', pass: '' };
    Auth.login(data);
  };
});

app.controller("main", function ($scope) {
  $scope.selectedIndex = 0;
  $scope.next = function () {
    $scope.selectedIndex = Math.min($scope.selectedIndex + 1, 5);
  };

  $scope.previous = function () {
    $scope.selectedIndex = Math.max($scope.selectedIndex - 1, 0);
  };
});

app.controller("Part_A", function ($scope, $http) {
  $scope.data = { civil_state: '', housing: '', children_num: '', performans: '', limitations: [] };

  $scope.housingOptions = 'En arriendo,Propia y la está pagando,Propia totalmente pagada,De un familiar sin pagar arriendo,De un tercero sin pagar arriendo,Otra'.split(',').map(function (option) {
    return option;
  });

  $scope.limitationsOptions = 'Moverse o caminar,Usar sus brazos y manos,Ver a pesar de usar lentes o gafas,Oír aún con aparatos especiales,Hablar,Entender o aprender,Relacionarse con los demás por problemas mentales o emocionales,Otra limitación permanente'.split(',').map(function (option) {
    return option;
  });

  $scope.toggle = function (item, list) {
    var not_have = $scope.exists(0, $scope.data.limitations);
    if (!not_have) {
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
    } else if (not_have && item == 0) {
      $scope.data.limitations = [];
    }
  };

  $scope.exists = function (item, list) {
    return list.indexOf(item) > -1;
  };

  $scope.on_performans = function () {
    return !$scope.exists(0, $scope.data.limitations) && $scope.data.limitations.length > 0;
  };

  $scope.enviar = function (data) {
    $http.post('http://localhost/questions/?action=PartA/saveData', data).then(function (res) {
      console.log(res);
    });
    $scope.next();
  };
});

app.controller("Part_B", function ($scope, $http) {
  $scope.lenguages_config = {
    ingles: [false, 0, 0, 0, 0],
    frances: [false, 0, 0, 0, 0],
    italiano: [false, 0, 0, 0, 0],
    portugues: [false, 0, 0, 0, 0],
    mandarin: [false, 0, 0, 0, 0],
    aleman: [false, 0, 0, 0, 0],
    japones: [false, 0, 0, 0, 0],
    arabe: [false, 0, 0, 0, 0]
  };
  $scope.data = {
    lenguages: $scope.lenguages_config,
    competences: {
      present_ideas: ['Exponer las ideas por medios escritos', 0, 2],
      com_orally: ['Comunicarse oralmente con claridad', 0, 2],
      pers_convince: ['Persuadir y convencer a sus interlocutores', 0, 2],
      iden_symb: ['Identificar y utilizar símbolos para comunicarse (lenguaje icónico, lenguaje no verbal, etc.)', 0, 2],
      accpet_dif: ['Aceptar las diferencias y trabajar en contexto multiculturales', 0, 3],
      use_tools: ['Utilizar herramientas informáticas básicas (procesadores de texto, hojas de cálculo, correo electrónico, etc.)', 0, 3],
      learn_update: ['Aprender y mantenerse actualizado', 0, 2],
      creative_innovative: ['Ser creativo e innovador', 0, 2],
      search_analyze_manage_share: ['Buscar, analizar, administrar y compartir información', 0, 2],
      create_innovate: ['Crear, investigar y adoptar tecnología', 0, 2],
      design_implement: ['Diseñar e implementar soluciones con el apoyo de tecnología', 0, 2],
      solve_problem: ['Identificar , plantear y resolver problemas', 0, 2],
      abstraction: ['Capacidad de abstracción análisis y síntesis', 0, 2],
      underst: ['Comprender la realidad que lo rodea', 0, 2],
      take_culture: ['Asumir una cultura de convivencia', 0, 2],
      assume_resp: ['Asumir responsabilidades y tomar decisiones', 0, 2],
      planning_time: ['Planificar y utilizar el tiempo de manera efectiva de tal forma que se logran los objetivos planteados.', 0, 3],
      computer_tools: ['Utilizar herramientas informáticas especializadas (paquetes estadísticos, software de diseño, etc.)', 0, 3],
      imp_projects: ['Formular y ejecutar proyectos', 0, 2],
      team_work: ['Trabajar en equipo para alcanzar metas comunes', 0, 3],
      indep_work: ['Trabajar de manera independiente sin supervisión permanente', 0, 3],
      apply_val: ['Aplicar valores y ética profesional en el desempeño laboral', 0, 3],
      adapt_changes: ['Adaptarse a los cambios (trabajar en contextos nuevos y diversos)', 0, 3],
      pressure_work: ['Trabajar bajo presión', 0, 2]
    },
    outstandings: {
      strong_comp: ['¿cuál de las competencias antes mencionadas considera que es la más fuerte?', 0],
      weak_comp: ['¿cuál de las competencias antes mencionadas considera que es la más débil?', 0],
      useful_comp: ['¿cuál considera que ha sido la más útil en su trayectoria laboral?', 0],
      useless_comp: ['¿cuál considera que ha sido la menos útil en su trayectoria laboral?', 0]
    }

  };
  $scope.not_lenguage = true;
  $scope.clean = function (config) {
    $scope.data.lenguages = config;
  };
  $scope.toogle = function () {
    $scope.not_lenguage = false;
  };

  $scope.enviar = function (data) {
    $http.post('http://localhost/questions/?action=PartB/saveData', data).then(function (res) {
      console.log(res);
    });
    $scope.next();
  };
});

app.controller("Part_C", function ($scope, $http) {
  $scope.data = { long_term: [], activity: [] };

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
  $scope.enviar = function (data) {
    $http.post('http://localhost/questions/?action=PartC/saveData', data).then(function (res) {
      console.log(res);
    });
    $scope.next();
  };
});

app.controller("Part_D", function ($scope, $http) {
  // Part 1
  $scope.data1 = { more_time_activity: 0, remunerated_activity: 0, diligence_work: 0, after_dilig_work: 0, reasons_not_dilig: 0, work_availab: 0, activity_role: 0 };

  // Part 2
  $scope.data2 = { first_work: 0, search_ch: 0, type_link: 0, current_occup: 0, eco_activity: 0, employment_relat: 0, last_entry: 0, week_work_hours_avg: 0, field_activity: 0, inst_links: 0 };

  // Part 3
  $scope.data3 = { first_work: 0, career_relat: 0, labour_forms: 0, eco_activity_alumn: 0, monthly_income: 0 };

  // Part 4
  $scope.data4 = { create_company: 0, main_difficulty: 0 };

  // Part 5
  $scope.data5 = { time_company: 0, career_relat: 0, eco_activity_company: 0, company_monthly_avg: 0 };

  // Part 6
  $scope.data6 = { exp_months: 0, study_exp_reality: 0, useful_knowledge: { work: 0, life: 0 }, work_contributes: 0, work_satisfaction: 0, study_level: 0, additional_interest: 0, other_work: 0, should_earn_more: 0 };

  // Part 7
  $scope.data7 = { looking_first_job: 0, months_looking_job: 0, get_job: 0, difficult_get_job: 0, search_ch_job: 0 };

  $scope.enviar = function (data1, data2, data3, data4, data5, data6, data7) {
    $http.post('http://localhost/questions/?action=PartDOne/saveData', data1).then(function (res) {
      console.log(res);
    });
    $http.post('http://localhost/questions/?action=PartDTwo/saveData', data2).then(function (res) {
      console.log(res);
    });
    $http.post('http://localhost/questions/?action=PartDThree/saveData', data3).then(function (res) {
      console.log(res);
    });
    $http.post('http://localhost/questions/?action=PartDFour/saveData', data4).then(function (res) {
      console.log(res);
    });
    $http.post('http://localhost/questions/?action=PartDFive/saveData', data5).then(function (res) {
      console.log(res);
    });
    $http.post('http://localhost/questions/?action=PartDSix/saveData', data6).then(function (res) {
      console.log(res);
    });
    $http.post('http://localhost/questions/?action=PartDSeven/saveData', data7).then(function (res) {
      console.log(res);
    });
    $scope.next();
  };
});

app.controller("Part_E", function ($scope, $http) {
  $scope.data = { classify_sense_belong: 0, eval_work_possib: 0, study_again: 0, reason_study_again: 0, reason_no_study_again: 0, want_other_study: 0, other_study: 0, recommend: 0 };
  $scope.enviar = function (data) {
    $http.post('http://localhost/questions/?action=PartE/saveData', data).then(function (res) {
      console.log(res);
    });
    $scope.next();
  };
});

app.controller("Part_F", function ($scope, $http) {
  $scope.data = { full_name: "", relationship: "", contry: "", departament: "", city: "", res_phone: "", mob_phone: "" };
  $scope.enviar = function (data) {
    $http.post('http://localhost/questions/?action=PartF/saveData', data).then(function (res) {
      console.log(res);
    });
    $scope.next();
  };
});

},{}]},{},[1]);
