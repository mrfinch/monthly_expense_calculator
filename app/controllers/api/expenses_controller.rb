module Api
  class ExpensesController < ApplicationController

    include ApplicationHelper
    before_filter :check_user_login

    def index
      expenses = current_user.expenses

      if params[:recently_added]
        expenses = expenses.order('created_at DESC')
      end

      total = expenses.count

      offset = params[:offset] || 0
      limit = params[:limit] || 5

      data = expenses.offset(offset).limit(limit).map { |exp| exp.attributes }

      render json: { data: data, status: true, total: total }, status: :ok
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
