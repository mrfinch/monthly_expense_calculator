class MonthlyExpenseCalculator.Views.DashboardMainView extends Backbone.View

  template: JST['backbone/templates/dashboard-main-view']
  className: 'dashboard-main-view'

  events:
    'click .js-show-more': 'showMoreContent'

  initialize: (options = {}) ->
    @model = options.model
    @collection = options.collection
    @title = options.title || 'Expenses'

  render: ->
    @title = if @collection.recentlyAdded then 'Recent Expenses' else 'Expenses'
    console.log @collection.start
    @$el.html @template(
      title: @title,
      start: @collection.start
    )

    @renderExpenses()

    @

  renderExpenses: ->
    console.error 'rend', @collection
    @$('.js-expenses').html('')
    _.each @collection.models, (model) =>
      expenseCardView = new MonthlyExpenseCalculator.Views.ExpenseCardView({model: model, parent: @, collection: @collection})
      @$('.js-expenses').append expenseCardView.render().el
    @$('.js-total-expenses').html(@collection.total_expenses)
    @renderShowMore()
    @listenTo @collection, 'change', @render
    @listenTo @collection, 'reset', @render
    # @listenTo @collection, 'add', @render # doing it after all models are added instead from showMoreContent

  renderShowMore: ->
    console.log @collection.num_of_expenses <= @collection.limit + @collection.start
    if @collection.num_of_expenses > @collection.limit + @collection.start
      @$('.js-show-more-div').removeClass('hidden')
    else
      @$('.js-show-more-div').addClass('hidden')
    @$('.js-show-more').data('id', @collection.start)

  showMoreContent: (e) ->
    @collection.start = @$('.js-show-more').data('id') + @collection.limit
    @collection.fetch
      remove: false
      success: (m, resp, opt) =>
        @render()
      error: (m, resp, opt) ->
        console.log 'error', m

  MECD = window.MECD ? {}
  MECD.DashboardMainView = DashboardMainView
