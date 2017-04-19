class MonthlyExpenseCalculator.Views.ExpenseCardView extends Backbone.View

  template: JST['backbone/templates/expense-card-view']
  className: 'expense-card-view card'

  initialize: (options = {}) ->
    console.log 'home view init', options
    @model = options.model

  render: ->
    console.log @model
    @$el.html @template(
      model: @model.toJSON()
    )

    @

  MECD = window.MECD ? {}
  MECD.ExpenseCardView = ExpenseCardView
