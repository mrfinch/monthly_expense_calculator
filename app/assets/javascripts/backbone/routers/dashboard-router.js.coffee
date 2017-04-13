class MonthlyExpenseCalculator.Routers.DashboardRouter extends Backbone.Router

  initialize: ->
    # set top bar
    console.log 'as'

  routes:
    'dashboard': 'dashboard'
    '*path': 'not_found'

  dashboard: ->
    console.log 'helo',MECD
    options = {a: 'hello'}
    dashboardView = new MonthlyExpenseCalculator.Views.DashboardView(options)
    # $('.mecd-main').html dashboardView.render().el
    @renderPage(dashboardView)

  not_found: ->
    console.log 'not found'

  renderPage: (view) ->
    topNavView = new MonthlyExpenseCalculator.Views.TopNavView({})
    $('#mecd-top-nav-container-id').html topNavView.render().el
    $('#mecd-full-container-id').html view.render().el

  MECD = window.MECD ? {}
  MECD.DashboardRouter = DashboardRouter
