'use strict';

var app = angular.module ('Questions', ['ngCookies', 'ui.router', 'ngMaterial', 'ngMessages', 'md.data.table']);

app.config (function ($stateProvider, $urlRouterProvider, $locationProvider) {
  $urlRouterProvider.otherwise ('/questions/user');

  $stateProvider.state ('user', {    
    url: '/questions/user',
    templateUrl: '/questions/views/partials/user.html',
    controller: 'UserCtrl'
  });

  $locationProvider.html5Mode (true);
}).run (function ($state) {
    $state.go ('user');
    event.preventDefault ();
});
