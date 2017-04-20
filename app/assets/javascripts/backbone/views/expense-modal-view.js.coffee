class MonthlyExpenseCalculator.Views.ExpenseModalView extends Backbone.View

  template: JST['backbone/templates/add-expense-modal']
  className: 'add-expense-modal'

  events:
    "submit form[name=add-expense]": 'addExpense'
    "submit form[name=edit-expense]": 'editExpense'

  initialize: (options = {}) ->
    console.log 'view init modal', options
    @model = options.model

  render: ->
    $(@el).html @template(
      model: @model?.toJSON()
    )
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

  editExpense: (e) ->
    console.log 'edit'
    e.preventDefault()
    data = $(e.currentTarget).serializeArray()
    _.each data, (obj) =>
      @model.set obj.name, obj.value
    @model.save
      success: (m) ->
        console.log 'success', m
      error: (m) ->
        console.log 'error', m

  MECD = window.MECD ? {}
  MECD.ExpenseModalView = ExpenseModalView
