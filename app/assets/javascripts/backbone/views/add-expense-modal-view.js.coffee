class MonthlyExpenseCalculator.Views.AddExpenseModalView extends Backbone.View

  template: JST['backbone/templates/add-expense-modal']
  className: 'add-expense-modal'

  initialize: (options = {}) ->
    console.log 'view init modal', options

  render: ->
    $(@el).html @template()
    @$('#expense-modal').modal()

    @

  MECD = window.MECD ? {}
  MECD.AddExpenseModalView = AddExpenseModalView
