class MonthlyExpenseCalculator.Views.DashboardView extends Backbone.View

  template: JST['backbone/templates/dashboard-view']
  className: 'dashboard-view'

  events:
    'click .js-add-expense': 'openAddExpenseModal'

  initialize: (options = {}) ->
    console.log 'view init', options

  render: =>
    $(@el).html @template()

    @renderRecentExpenses()

    @

  openAddExpenseModal: (e) ->
    addExpenseModal = new MonthlyExpenseCalculator.Views.ExpenseModalView
    @$('.js-add-expense-modal').html addExpenseModal.render().el

  renderRecentExpenses: ->
    @recentExpenseCollection = new MonthlyExpenseCalculator.Collections.ExpensesCollection
    @recentExpenseCollection.fetchRecentlyAddedExpense(true)
    @recentExpenseCollection.fetch
      success: (collection) ->
        console.log collection, 'succ'
        _.each collection.models, (model) ->
          expenseCardView = new MonthlyExpenseCalculator.Views.ExpenseCardView({model: model})
          @$('.js-recent-expenses').append expenseCardView.render().el
      error: (m) ->
        console.log m

  MECD = window.MECD ? {}
  MECD.DashboardView = DashboardView
