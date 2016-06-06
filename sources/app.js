'use strict';

var app = angular.module('Questions', ['ngMaterial']);

app.controller("main", function ($scope) {
  $scope.selectedIndex = 4;
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
  $scope.lenguages_config = {
    ingles:     [false, 0, 0, 0, 0],
    frances:    [false, 0, 0, 0, 0],
    italiano:   [false, 0, 0, 0, 0],
    portugues:  [false, 0, 0, 0, 0],
    mandarin:   [false, 0, 0, 0, 0],
    aleman:     [false, 0, 0, 0, 0],
    japones:    [false, 0, 0, 0, 0],
    arabe:      [false, 0, 0, 0, 0],
  };
 $scope.not_lenguage = true;
 $scope.lenguages = $scope.lenguages_config;
 $scope.clean = function(){
   $scope.lenguages = {
     ingles:     [false, 0, 0, 0, 0],
     frances:    [false, 0, 0, 0, 0],
     italiano:   [false, 0, 0, 0, 0],
     portugues:  [false, 0, 0, 0, 0],
     mandarin:   [false, 0, 0, 0, 0],
     aleman:     [false, 0, 0, 0, 0],
     japones:    [false, 0, 0, 0, 0],
     arabe:      [false, 0, 0, 0, 0],
   };
 };
 $scope.toogle = function(){$scope.not_lenguage = false};

 $scope.competences = {
   present_ideas: ['Exponer las ideas por medios escritos', 0, 2],
   com_orally: ['Comunicarse oralmente con claridad', 0, 2],
   pers_convince: ['Persuadir y convencer a sus interlocutores', 0, 2],
   iden_symb:['Identificar y utilizar símbolos para comunicarse (lenguaje icónico, lenguaje no verbal, etc.)', 0, 2],
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
   take_culture: ['Asumir una cultura de convivencia',0, 2],
   assume_resp: ['Asumir responsabilidades y tomar decisiones', 0,2],
   planning_time: ['Planificar y utilizar el tiempo de manera efectiva de tal forma que se logran los objetivos planteados.', 0, 3],
   computer_tools: ['Utilizar herramientas informáticas especializadas (paquetes estadísticos, software de diseño, etc.)', 0, 3],
   imp_projects: ['Formular y ejecutar proyectos', 0, 2],
   team_work: ['Trabajar en equipo para alcanzar metas comunes', 0, 3],
   indep_work: ['Trabajar de manera independiente sin supervisión permanente', 0, 3],
   apply_val: ['Aplicar valores y ética profesional en el desempeño laboral', 0, 3],
   adapt_changes: ['Adaptarse a los cambios (trabajar en contextos nuevos y diversos)', 0, 3],
   pressure_work: ['Trabajar bajo presión', 0, 2]
 };

 $scope.outstandings = {
   strong_comp: ['¿cuál de las competencias antes mencionadas considera que es la más fuerte?', 0],
   weak_comp: ['¿cuál de las competencias antes mencionadas considera que es la más débil?', 0],
   useful_comp: ['¿cuál considera que ha sido la más útil en su trayectoria laboral?', 0],
   useless_comp: ['¿cuál considera que ha sido la menos útil en su trayectoria laboral?', 0]
 };

 $scope.enviar = function() {
   $scope.next();
 };
});

app.controller("Part_C", function ($scope) {
  $scope.long_term = "";
  $scope.activity = "";
});

app.controller("Part_D", function ($scope) {

});

app.controller("Part_E", function ($scope) {
  $scope.classify_sense_belong = 0;
  $scope.eval_work_possib = 0;
  $scope.study_again = 0;
  $scope.reason_study_again = 0;
  $scope.reason_no_study_again = 0;
  $scope.want_other_study = 0;
  $scope.other_study = 0;
  $scope.recommend = 0;
});

app.controller("Part_F", function ($scope) {
  $scope.full_name = "";
  $scope.relationship = "";
  $scope.contry = "";
  $scope.departament = "";
  $scope.city = "";
  $scope.res_phone = "";
  $scope.mob_phone = "";
});
