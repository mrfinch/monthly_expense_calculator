class MonthlyExpenseCalculator.Views.DashboardView extends Backbone.View

  template: JST['backbone/templates/dashboard-view']
  className: 'dashboard-view'

  events:
    'click .js-add-expense': 'openAddExpenseModal'

  initialize: (options = {}) ->
    @collection = new MonthlyExpenseCalculator.Collections.ExpensesCollection

  render: =>
    $(@el).html @template()

    @renderRecentExpenses()

    @

  openAddExpenseModal: (e) ->
    addExpenseModal = new MonthlyExpenseCalculator.Views.ExpenseModalView({parent: @, collection: @collection})
    @$('.js-add-expense-modal').html addExpenseModal.render().el

  renderRecentExpenses: ->
    @collection.fetchRecentlyAddedExpense(true)
    @collection.fetch
      success: (collection) =>
        console.log collection, 'succ'
        @displayRecentExpenses()
        # _.each collection.models, (model) ->
        #   expenseCardView = new MonthlyExpenseCalculator.Views.ExpenseCardView({model: model, parent: @})
        #   @$('.js-recent-expenses').append expenseCardView.render().el
      error: (m) ->
        console.log m

  displayRecentExpenses: ->
    console.error 'helllll'
    @$('.js-recent-expenses').html('')
    _.each @collection.models, (model) =>
      expenseCardView = new MonthlyExpenseCalculator.Views.ExpenseCardView({model: model, parent: @, @collection})
      @$('.js-recent-expenses').append expenseCardView.render().el
    console.log @collection.total_expenses
    @$('.js-total-expenses').html(@collection.total_expenses)
    # @listenTo @collection, 'change', @renderRecentExpenses()
    # @collection.on 'change', @displayRecentExpenses()


  MECD = window.MECD ? {}
  MECD.DashboardView = DashboardView
