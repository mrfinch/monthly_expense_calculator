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
    $('.mecd-main').html dashboardView.render().el

  not_found: ->
    console.log 'not found'

  MECD = window.MECD ? {}
  MECD.DashboardRouter = DashboardRouter
