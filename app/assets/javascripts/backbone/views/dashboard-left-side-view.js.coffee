class MonthlyExpenseCalculator.Views.DashboardLeftSideView extends Backbone.View

  template: JST['backbone/templates/dashboard-left-side-view']
  className: 'dashboard-left-side-view'

  initialize: (options = {}) ->
    @model = options.model
    @collection = options.collection

  render: ->
    @$el.html @template()

    @

  MECD = window.MECD ? {}
  MECD.DashboardLeftSideView = DashboardLeftSideView
