(function() {
  var app = angular.module('kalender', ['ui.router','ngAnimate']);

  app.config(function($stateProvider,$urlRouterProvider,$locationProvider) {

    $stateProvider
      .state('signUp', {
        url:'/',
        controller:'SignUpController as signUpCtrl',
        templateUrl: '/views/partials/signup.html'
      });

    $urlRouterProvider.otherwise('/');

    $locationProvider.html5Mode(true);
  });

  app.controller('SignUpController', ['$http', function($http) {

    var self = this;

    self.signUp = function() {

      var patient = {
        email: self.patientEmail,
        password: self.patientPassword,
        confirmation: self.patientPasswordConfirmation
      };

      console.log(patient);

    };


  }]);


}());
