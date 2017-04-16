class MonthlyExpenseCalculator.Views.TopNavView extends Backbone.View

  template: JST['backbone/templates/top-nav-view']
  className: 'top-nav-view'

  events:
    'click .js-login': 'login'
    'click .js-signup': 'signup'

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

  MECD = window.MECD ? {}
  MECD.TopNavView = TopNavView
