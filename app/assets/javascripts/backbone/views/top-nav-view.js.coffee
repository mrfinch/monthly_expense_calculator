class MonthlyExpenseCalculator.Views.TopNavView extends Backbone.View

  template: JST['backbone/templates/top-nav-view']
  className: 'top-nav-view'
  tagName: 'div'

  initialize: (options = {}) ->
    console.log 'top view init', options

  render: =>
    console.log @template()
    @$el.html @template()
    # $(@el).html '<ul><li>Hello, Backbone!</li></ul>'

    @

  MECD = window.MECD ? {}
  MECD.TopNavView = TopNavView