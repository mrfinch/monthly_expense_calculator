class MonthlyExpenseCalculator.Views.LoginSignupModalView extends Backbone.View

  template: JST['backbone/templates/login-signup-modal']
  className: 'login-signup-modal-view'

  events:
    'click .js-show-signup': 'showSignupView'
    'click .js-show-login': 'showLoginView'

  initialize: (options = {}) ->
    console.log 'view init modal', options
    @showLogin = options.showLogin

  render: ->
    $(@el).html @template(
      showLogin: @showLogin
    )
    @$('#login-signup-modal').modal()

    @

  showLoginView: (e) ->
    e.preventDefault()
    @showLogin = true
    $('.modal-backdrop').addClass('hidden')
    @render()

  showSignupView: (e) ->
    e.preventDefault()
    @showLogin = false
    $('.modal-backdrop').addClass('hidden')
    @render()


  MECD = window.MECD ? {}
  MECD.LoginSignupModalView = LoginSignupModalView
