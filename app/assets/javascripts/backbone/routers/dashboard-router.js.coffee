class MonthlyExpenseCalculator.Routers.DashboardRouter extends Backbone.Router

  initialize: ->
    # set top bar
    console.log 'router initialize'
    unless MECD.currentUser
      user = new MonthlyExpenseCalculator.Models.UserModel
      user.fetch
        success: (m) ->
          MECD.currentUser = m
        error: (m) ->
          console.log m

  routes:
    'dashboard': 'dashboard'
    'home': 'home'
    '': 'redirect'
    '*path': 'not_found'

  dashboard: ->
    console.log 'helo',MECD
    options = {a: 'hello'}
    dashboardView = new MonthlyExpenseCalculator.Views.DashboardView(options)
    # $('.mecd-main').html dashboardView.render().el
    @renderPage(dashboardView)

  home: ->
    homePageView = new MonthlyExpenseCalculator.Views.HomePageView({})
    @renderPage(homePageView)

  redirect: ->
    console.log 'redirect',MECD.currentUser
    if _.isObject(MECD.currentUser)
      Backbone.history.navigate('dashboard', { trigger: true, replace: true })
    else
      Backbone.history.navigate('home', { trigger: true, replace: true })

  not_found: ->
    console.log 'not found'

  renderPage: (view) ->
    options = { loggedIn: MECD.currentUser? }
    topNavView = new MonthlyExpenseCalculator.Views.TopNavView(options)
    $('#mecd-top-nav-container-id').html topNavView.render().el
    $('#mecd-full-container-id').html view.render().el

  MECD = window.MECD ? {}
  MECD.DashboardRouter = DashboardRouter
