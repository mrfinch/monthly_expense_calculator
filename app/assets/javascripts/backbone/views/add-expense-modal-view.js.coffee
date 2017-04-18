class MonthlyExpenseCalculator.Views.AddExpenseModalView extends Backbone.View

  template: JST['backbone/templates/add-expense-modal']
  className: 'add-expense-modal'

  events:
    "submit form[name=add-expense]": 'addExpense'

  initialize: (options = {}) ->
    console.log 'view init modal', options

  render: ->
    $(@el).html @template()
    @$('#expense-modal').modal()

    @

  addExpense: (e) ->
    e.preventDefault()
    data = $(e.currentTarget).serializeArray()
    console.log 'add', data
    final_data = {}
    _.each data, (obj) ->
      final_data[obj.name] = obj.value
    console.log final_data
    @model = new MonthlyExpenseCalculator.Models.ExpenseModel
    @model.save(final_data,
      success: (m) ->
        console.log m
      error: (m) ->
        console.log m,'err'
    )

  MECD = window.MECD ? {}
  MECD.AddExpenseModalView = AddExpenseModalView
