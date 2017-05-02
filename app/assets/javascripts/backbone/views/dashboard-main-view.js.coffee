class MonthlyExpenseCalculator.Views.DashboardMainView extends Backbone.View

  template: JST['backbone/templates/dashboard-main-view']
  className: 'dashboard-main-view'

  initialize: (options = {}) ->
    @model = options.model
    @collection = options.collection
    @title = options.title || 'Expenses'

  render: ->
    @title = if @collection.recentlyAdded then 'Recently Expenses' else 'Expenses'

    @$el.html @template(
      title: @title
    )

    @renderExpenses()

    @

  renderExpenses: ->
    console.error 'rend', @collection
    @$('.js-expenses').html('')
    _.each @collection.models, (model) =>
      expenseCardView = new MonthlyExpenseCalculator.Views.ExpenseCardView({model: model, parent: @, collection: @collection})
      @$('.js-expenses').append expenseCardView.render().el
    @$('.js-total-expenses').html(@collection.total_expenses)
    @listenTo @collection, 'change', @render
    @listenTo @collection, 'reset', @render

  MECD = window.MECD ? {}
  MECD.DashboardMainView = DashboardMainView
