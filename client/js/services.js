'use strict';

app.service('Auth',function ($http, $cookies, $location) {
  this.login = function (data) {
    $http.post('/?action=Graduate/sigin', data ).then(function(res) {
      console.log(res);
      console.log($cookies.get('rol'));
      $cookies.put('user', res.data.dataset.id);
      $cookies.put('rol', res.data.dataset.role);
      console.log($cookies.get('rol'));
      if (res.data.dataset.role == 0) {
        $location.path('/');
      } else{
        $location.path('/admin');
      }
    });
  };

  this.is_login = function () {
    if ($cookies.get('user') != null) {return true;}else {return false;}
  };

  this.logout = function(){
    $http.post('/?action=Graduate/logout').then(function(res) {
      console.log(res);
      $cookies.remove('user');
      $cookies.remove('rol');
      $location.path('/signin');
    });

  };

});
