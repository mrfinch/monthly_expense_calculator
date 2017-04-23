class MonthlyExpenseCalculator.Models.UserModel extends Backbone.Model

  urlRoot:
    '/api/users'

  initialize: (options = {}) ->
    console.log 'view user model', options

  parse: (response, options) ->
    if _.isObject(response.model)
      response.model
    else
      response

  MECD = window.MECD ? {}
  MECD.UserModel = UserModel
