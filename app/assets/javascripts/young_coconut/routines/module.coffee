#= require ../api/module
#= require_self
#= require ./routine
#= require ./routine-service
#= require ./routine-list-controller

dependencies = [
  'ngResource'
  'YoungCoconut::Api'
]

routines = angular.module('YoungCoconut::Routines', dependencies)
