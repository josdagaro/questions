'use strict';

app.service('Auth',function ($http, $cookies, $location) {
  this.login = function (data) {
    $http.post('http://localhost/?action=Graduate/sigin', data ).then(function(res) {
      $cookies.put('user', res.data.dataset.id);
      $cookies.put('rol', res.data.dataset.role);
      if (res.data.dataset.role == 0) {
        $location.path('/');
      } else{
        $location.path('/admin');
      }

    });
  };
  this.is_login = function () {
    if ($cookies.get('user') != null) {return true;}else {return false;}
  }
});
