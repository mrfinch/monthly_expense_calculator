class MonthlyExpenseCalculator.Views.ExpenseCardView extends Backbone.View

  template: JST['backbone/templates/expense-card-view']
  className: 'expense-card-view'

  events:
    'click .js-edit-expense': 'editExpense'

  initialize: (options = {}) ->
    console.log 'init card', options, @model.get('cost')
    @model = options.model
    @parent = options.parent

  render: ->
    console.log @model
    @$el.html @template(
      model: @model.toJSON()
    )

    @

  editExpense: (e) ->
    e.preventDefault()
    editExpenseModal = new MonthlyExpenseCalculator.Views.ExpenseModalView({model: @model, parent: @parent})
    $('.js-add-expense-modal').html editExpenseModal.render().el

  MECD = window.MECD ? {}
  MECD.ExpenseCardView = ExpenseCardView
