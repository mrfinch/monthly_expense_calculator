class MonthlyExpenseCalculator.Routers.DashboardRouter extends Backbone.Router

  initialize: ->
    # set top bar
    console.log 'as'

  routes:
    'dashboard': 'dashboard'
    'home': 'home'
    '*path': 'not_found'

  dashboard: ->
    console.log 'helo',MECD
    options = {a: 'hello'}
    dashboardView = new MonthlyExpenseCalculator.Views.DashboardView(options)
    # $('.mecd-main').html dashboardView.render().el
    @renderPage(dashboardView, true)

  home: ->
    homePageView = new MonthlyExpenseCalculator.Views.HomePageView({})
    @renderPage(homePageView, false)

  not_found: ->
    console.log 'not found'

  renderPage: (view, loggedIn = false) ->
    options = { loggedIn: loggedIn } # this is temporary, remove after user model authentication is done
    topNavView = new MonthlyExpenseCalculator.Views.TopNavView(options)
    $('#mecd-top-nav-container-id').html topNavView.render().el
    $('#mecd-full-container-id').html view.render().el

  MECD = window.MECD ? {}
  MECD.DashboardRouter = DashboardRouter
