class MonthlyExpenseCalculator.Collections.ExpensesCollection extends Backbone.Collection
  model: MonthlyExpenseCalculator.Models.ExpenseModel

  initialize: (options = {}) ->
    console.log 'view init Collection', options
    @limit = 5
    @start = 0

  url: ->
    url = "/api/expenses?limit=#{@limit}&start=#{@start}"
    if @recentlyAdded
      url += '&recently_added=true'
    url

  fetchRecentlyAddedExpense: (recent) ->
    @recentlyAdded = recent

  parse: (response, options) ->
    @total = response.total

    if _.isObject(response.data)
      response.data
    else
      response

  MECD = window.MECD ? {}
  MECD.ExpensesCollection = ExpensesCollection
