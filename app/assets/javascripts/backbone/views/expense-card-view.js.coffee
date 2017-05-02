class MonthlyExpenseCalculator.Views.ExpenseCardView extends Backbone.View

  template: JST['backbone/templates/expense-card-view']
  className: 'expense-card-view'

  events:
    'click .js-edit-expense': 'editExpense'
    'click .js-delete-expense': 'deleteExpense'

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

  deleteExpense: (e) ->
    e.preventDefault()
    expenseId = $(e.currentTarget).data('id')
    @model.destroy(
      success: (m, resp, opt) =>
        @collection.fetch({reset: true})
      error: (m, resp, opt) =>
        console.log 'err', m
    )

  MECD = window.MECD ? {}
  MECD.ExpenseCardView = ExpenseCardView
