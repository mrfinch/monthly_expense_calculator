class MonthlyExpenseCalculator.Models.ExpensesCollection extends Backbone.Collection

  url:
    '/api/expenses'

  initialize: (options = {}) ->
    console.log 'view init Collection', options

  MECD = window.MECD ? {}
  MECD.ExpensesCollection = ExpensesCollection
