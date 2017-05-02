class MonthlyExpenseCalculator.Views.DashboardMainView extends Backbone.View

  template: JST['backbone/templates/dashboard-main-view']
  className: 'dashboard-main-view'

  initialize: (options = {}) ->
    @model = options.model
    @collection = options.collection
    @title = options.title || 'Expenses'

  render: ->
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
    @listenTo @collection, 'change', @renderExpenses
    @listenTo @collection, 'reset', @renderExpenses

  MECD = window.MECD ? {}
  MECD.DashboardMainView = DashboardMainView
