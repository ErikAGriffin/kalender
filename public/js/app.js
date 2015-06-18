(function() {
  var app = angular.module('kalender', ['ui.router','ngAnimate']);

  app.config(function($stateProvider,$urlRouterProvider,$locationProvider) {

    $stateProvider
      .state('signUp', {
        url:'/',
        controller:'NewPatientSignUpController as newPatientCtrl',
        templateUrl: '/views/partials/signup.html'
      });

    $urlRouterProvider.otherwise('/');

    $locationProvider.html5Mode(true);
  });

  app.controller('NewPatientSignUpController', ['$http', function($http) {

    var self = this;

    self.signUp = function() {

      var patient = {
        firstName: self.patientFirstName,
        lastName: self.patientLastName,
        email: self.patientEmail,
        password: self.patientPassword,
        confirmation: self.patientPasswordConfirmation
      };

      var family = {
        firstName: self.familyFirstName,
        lastName: self.familyLastName,
        email: self.familyEmail,
        password: self.familyPassword,
        confirmation: self.familyPasswordConfirmation
      };

      console.log(patient);
      console.log(family);
      $http.post('/newpatient',{patient:patient,family:family})
        .success(function(data,status) {
          console.log(status+': Success!');
          console.log(data);
        })
        .error(function(data,status) {
          console.log(status+': An error has occurred');
        });

    };


  }]);


}());
