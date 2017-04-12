class MonthlyExpenseCalculator.Views.DashboardView extends Backbone.View

  template: JST['backbone/templates/dashboard-view']
  className: 'dashboard-view'
  tagName: 'div'

  initialize: (options = {}) ->
    console.log 'view init', options

  render: =>
    console.log @template()
    @$el.html @template()
    # $(@el).html '<ul><li>Hello, Backbone!</li></ul>'

    @

  MECD = window.MECD ? {}
  MECD.DashboardView = DashboardView