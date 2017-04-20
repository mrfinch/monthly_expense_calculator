class MonthlyExpenseCalculator.Views.ExpenseCardView extends Backbone.View

  template: JST['backbone/templates/expense-card-view']
  className: 'expense-card-view'

  events:
    'click .js-edit-expense': 'editExpense'

  initialize: (options = {}) ->
    console.log 'home view init', options
    @model = options.model

  render: ->
    console.log @model
    @$el.html @template(
      model: @model.toJSON()
    )

    @

  editExpense: (e) ->
    e.preventDefault()
    editExpenseModal = new MonthlyExpenseCalculator.Views.ExpenseModalView({model: @model})
    $('.js-add-expense-modal').html editExpenseModal.render().el

  MECD = window.MECD ? {}
  MECD.ExpenseCardView = ExpenseCardView
