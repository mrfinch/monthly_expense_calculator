class MonthlyExpenseCalculator.Views.HomePageView extends Backbone.View

  template: JST['backbone/templates/home-page-view']
  className: 'home-page-view'

  initialize: (options = {}) ->
    console.log 'home view init', options

  render: =>
    console.log @template()
    @$el.html @template()
    # $(@el).html '<ul><li>Hello, Backbone!</li></ul>'

    @

  MECD = window.MECD ? {}
  MECD.HomePageView = HomePageView
