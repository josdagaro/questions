'use strict';

app.controller("Part_B", function ($scope, $http) {
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
  $scope.data ={
    lenguages: $scope.lenguages_config,
    competences: {
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
    },
    outstandings: {
      strong_comp: ['¿cuál de las competencias antes mencionadas considera que es la más fuerte?', 0],
      weak_comp: ['¿cuál de las competencias antes mencionadas considera que es la más débil?', 0],
      useful_comp: ['¿cuál considera que ha sido la más útil en su trayectoria laboral?', 0],
      useless_comp: ['¿cuál considera que ha sido la menos útil en su trayectoria laboral?', 0]
    }

  };
 $scope.not_lenguage = true;
 $scope.clean = function(config){
   $scope.data.lenguages = config;
 };
 $scope.toogle = function(){$scope.not_lenguage = false};

 $scope.enviar = function(data) {
   $http.post('/?action=PartB/saveData', data ).then(function(res) {console.log(res);});
   $scope.next();
 };
});
