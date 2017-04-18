class MonthlyExpenseCalculator.Models.ExpenseModel extends Backbone.Model

  urlRoot:
    '/api/expenses'

  initialize: (options = {}) ->
    console.log 'view init model', options

  parse: (response, options) ->
    if _.isObject(response.model)
      response.model
    else
      response

  MECD = window.MECD ? {}
  MECD.ExpenseModel = ExpenseModel
