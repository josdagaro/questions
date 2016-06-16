'use strict';

app.service('Auth',function ($http, $cookies, $location) {
  this.login = function (data) {
    $http.post('http://localhost/?action=Graduate/sigin', data ).then(function(res) {
      console.log(res);
      console.log($cookies.get('rol'));
      // $cookies.put('user', res.data.dataset.id);
      $cookies.put('rol', 1);
      console.log($cookies.get('rol'));
      // if (res.data.dataset.role == 0) {
      //   $location.path('/');
      // } else{
      //   $location.path('/admin');
      // }
        $location.path('/admin');
    });
  };

  this.is_login = function () {
    if ($cookies.get('user') != null) {return true;}else {return false;}
  };

  this.logout = function(){
    $cookies.remove('user');
    $cookies.remove('rol');
    $location.path('/signin');
  };

});
