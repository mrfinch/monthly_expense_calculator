class MonthlyExpenseCalculator.Views.DashboardLeftSideView extends Backbone.View

  template: JST['backbone/templates/dashboard-left-side-view']
  className: 'dashboard-left-side-view'

  events:
    'click .js-quick-links': 'changeMainView'

  initialize: (options = {}) ->
    @model = options.model
    @collection = options.collection
    @recentExpense = options.recentExpense

  render: ->
    @$el.html @template(
      recentExpense: @recentExpense
    )

    @

  changeMainView: (e) ->
    console.log 'here'
    e.preventDefault()
    _.each @$('.js-quick-links'), (elem) ->
      $(elem).addClass('inherit-color').removeClass('left-side-anchor')
    $(e.currentTarget).addClass('left-side-anchor')

    if $(e.currentTarget).hasClass('js-recent-expenses-link')
      @collection.fetchRecentlyAddedExpense(true)
    else
      @collection.fetchRecentlyAddedExpense(false)
    @collection.limit = 5
    @collection.start = 0
    @collection.fetch({reset: true})

  MECD = window.MECD ? {}
  MECD.DashboardLeftSideView = DashboardLeftSideView
