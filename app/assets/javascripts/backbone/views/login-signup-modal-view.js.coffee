class MonthlyExpenseCalculator.Views.LoginSignupModalView extends Backbone.View

  template: JST['backbone/templates/login-signup-modal']
  className: 'login-signup-modal-view'

  events:
    'click .js-show-signup': 'showSignupView'
    'click .js-show-login': 'showLoginView'
    'submit form[name=login-form]': 'loginUser'
    'submit form[name=signup-form]': 'signupUser'

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
    @removeModalBackdrop()
    @render()

  showSignupView: (e) ->
    e.preventDefault()
    @showLogin = false
    @removeModalBackdrop()
    @render()

  loginUser: (e) ->
    e.preventDefault()

  signupUser: (e) ->
    e.preventDefault()
    console.log 'signup'
    data = $(e.currentTarget).serializeArray()

    $.ajax
      type: 'POST'
      data: data
      url: 'auth/signup'
      success: (result,status,xhr) =>
        console.log result
        @removeModalBackdrop()
        @$('#login-signup-modal').modal('hide')
        $('body').removeClass('modal-open')
      error: (xhr,status,error) ->
        console.log xhr

  loginUser: (e) ->
    e.preventDefault()
    data = $(e.currentTarget).serializeArray()
    $.ajax
      type: 'POST'
      data: data
      url: 'auth/login'
      success: (result, status, xhr) =>
        console.log result
        MECD.currentUser = result.model
        @$('#login-signup-modal').modal('hide')
        @removeModalBackdrop()
        $('body').removeClass('modal-open') # bcoz bootstrap hide doesn't remove it affecting scroll on dashobard page
        Backbone.history.fragment = null if Backbone.history.fragment == 'dashboard' # so that dashboard page gets reloaded from dashboard page too
        Backbone.history.navigate('dashboard', { trigger: true })
      error: (xhr, status, error) ->
        console.log xhr

  removeModalBackdrop: ->
    $('.modal-backdrop').addClass('hidden')

  MECD = window.MECD ? {}
  MECD.LoginSignupModalView = LoginSignupModalView
