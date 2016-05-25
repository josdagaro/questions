'use strict';

var app = angular.module ('Questions', ['ngCookies', 'ui.router', 'ngMaterial', 'ngMessages', 'md.data.table']);

app.config (function ($stateProvider, $urlRouterProvider, $locationProvider) {
  $urlRouterProvider.otherwise ("/");

  $stateProvider.state ('user', {
    url: '/user',
    templateUrl: '/partials/user',
    controller: 'UserCtrl'
  });

  //$locationProvider.html5Mode(true);
}).run (function ($rootScope, $state) {
    //$rootScope.$on ("$stateChangeStart", function (event, toState) {    
    $state.go ('user');
    //event.preventDefault ();
  //});
});
