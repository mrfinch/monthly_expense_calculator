class MonthlyExpenseCalculator.Views.ExpenseModalView extends Backbone.View

  template: JST['backbone/templates/add-expense-modal']
  className: 'add-expense-modal'

  events:
    "submit form[name=add-expense]": 'addExpense'
    "submit form[name=edit-expense]": 'editExpense'

  initialize: (options = {}) ->
    console.log 'view init expense modal', options, @parent
    @model = options.model
    @parent = options.parent
    @collection = options.collection

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
    @model = new MonthlyExpenseCalculator.Models.ExpenseModel
    @model.save(final_data,
      success: (m, resp, opt) =>
        console.log 'model create', m
        @$('#expense-modal').modal('hide')
        @collection.fetch
          reset: true
          success: (collection) =>
            console.log 'coll success', collection
            # @parent.displayRecentExpenses()
          error: (c) ->
            console.log c
      error: (m) ->
        console.log m,'err'
    )

  editExpense: (e) ->
    console.log 'edit'
    e.preventDefault()
    data = $(e.currentTarget).serializeArray()
    console.log data
    temp = {}
    _.each data, (obj) =>
      temp[obj.name] = obj.value
    @model.set temp, { silent: true }
    console.log @model
    @model.save(null,
      success: (m, resp, opt) =>
        @$('#expense-modal').modal('hide')
        @collection.fetch
          success: (collection) =>
            console.log 'coll success', collection
            # @parent.renderExpenses()
          error: (c) ->
            console.log c
      error: (m) ->
        console.log 'error', m
    )

  MECD = window.MECD ? {}
  MECD.ExpenseModalView = ExpenseModalView
