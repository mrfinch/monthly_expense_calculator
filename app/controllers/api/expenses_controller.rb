module Api
  class ExpensesController < ApplicationController

    include ApplicationHelper
    before_filter :check_user_login

    def index

    end

    def create
      expense = Expense.new(name: params[:name], cost: params[:cost])
      expense.made_on = Time.now
      expense.user = current_user

      if expense.save
        render json: { model: expense.attributes, status: true }, status: :ok
      else
        render json: { model: {}, status: false }, status: 400
      end
    end

  end
end
