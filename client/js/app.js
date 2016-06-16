'use strict';

var app = angular.module('Questions', ['ngMaterial', 'ngRoute', 'ngCookies', 'chart.js']);

app.config(function($routeProvider, ChartJsProvider) {
  $routeProvider
    .when('/',{
      controller: 'main',
      templateUrl: "views/questions.html",
      auth: 0
    })
    .when('/admin',{
      controller: 'admin',
      templateUrl: "views/admin.html",
      auth: 1
    })
    .when('/signin',{
      controller: 'signin',
      templateUrl: 'views/signin.html',
      auth: 'public'
    });

});

app.run(function($rootScope, $location, Auth, $cookies) {
  $rootScope.$on("$routeChangeStart", function(evt, to, from) {
    console.log(to);
    // if (to.$$route.auth != 'public') {
    //   if (Auth.is_login()) {
    //     console.log('Esta loggueado');
    //     if (to.auth != $cookies.get('rol')) {
    //       $location.path('/signin')
    //     }
    //   }else {
    //     $location.path('/signin')
    //   }
    // }
  });
});
