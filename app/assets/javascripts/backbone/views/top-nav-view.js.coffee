class MonthlyExpenseCalculator.Views.TopNavView extends Backbone.View

  template: JST['backbone/templates/top-nav-view']
  className: 'top-nav-view'

  events:
    'click .js-login': 'login'
    'click .js-signup': 'signup'
    'click .js-logout': 'logOut'

  initialize: (options = {}) ->
    console.log 'top view init', options
    @loggedIn = options.loggedIn

  render: =>
    # console.log @template()
    @$el.html @template(
      loggedIn: @loggedIn
    )
    # $(@el).html '<ul><li>Hello, Backbone!</li></ul>'

    @

  login: (e) ->
    e.preventDefault()
    @showLoginSignupModal(true)

  signup: (e) ->
    e.preventDefault()
    @showLoginSignupModal(false)

  showLoginSignupModal: (login = true) ->
    options = { showLogin: login }
    loginSignuModal = new MonthlyExpenseCalculator.Views.LoginSignupModalView(options)
    # console.log loginSignuModal.render().el
    @$('.js-signup-login').html loginSignuModal.render().el

  logOut: (e) ->
    e.preventDefault()
    $.ajax
      type: 'GET'
      url: 'auth/logout'
      success: (result,status,xhr) =>
        console.log result
        MECD.currentUser = null
        Backbone.history.navigate('home', { trigger: true })
      error: (xhr,status,error) ->
        console.log xhr

  MECD = window.MECD ? {}
  MECD.TopNavView = TopNavView
