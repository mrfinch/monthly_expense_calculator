class MonthlyExpenseCalculator.Views.DashboardView extends Backbone.View

  template: JST['backbone/templates/dashboard-view']
  className: 'dashboard-view'
  tagName: 'div'

  events:
    'click .js-add-expense': 'openAddExpenseModal'

  initialize: (options = {}) ->
    console.log 'view init', options

  render: =>
    $(@el).html @template()

    @

  openAddExpenseModal: (e) ->
    console.log 'modal'
    addExpenseModal = new MonthlyExpenseCalculator.Views.AddExpenseModalView
    @$('.js-add-expense-modal').html addExpenseModal.render().el

  MECD = window.MECD ? {}
  MECD.DashboardView = DashboardView