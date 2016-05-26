'use strict';

var app = angular.module ('Questions');

app.controller ('UserCtrl', function ($scope, $cookies) {
    $scope.message = 'Hi, ¿how are you?';
});

