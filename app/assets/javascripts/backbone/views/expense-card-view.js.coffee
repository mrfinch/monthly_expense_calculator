class MonthlyExpenseCalculator.Views.ExpenseCardView extends Backbone.View

  template: JST['backbone/templates/expense-card-view']
  className: 'expense-card-view'

  events:
    'click .js-edit-expense': 'editExpense'

  initialize: (options = {}) ->
    @model = options.model
    @parent = options.parent
    @collection = options.collection

  render: ->
    @$el.html @template(
      model: @model.toJSON()
    )

    @

  editExpense: (e) ->
    e.preventDefault()
    editExpenseModal = new MonthlyExpenseCalculator.Views.ExpenseModalView({model: @model, parent: @parent, collection: @collection})
    $('.js-add-expense-modal').html editExpenseModal.render().el

  MECD = window.MECD ? {}
  MECD.ExpenseCardView = ExpenseCardView
