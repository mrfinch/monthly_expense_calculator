module Api
  class ExpensesController < ApplicationController

    include ApplicationHelper
    before_filter :check_user_login
    before_filter :can_update_expense?, only: [:update, :destroy]

    def index
      expenses = current_user.not_deleted_expenses

      if params[:recently_added]
        expenses = expenses.order('created_at DESC')
      end

      total = expenses.count

      offset = params[:start] || 0
      limit = params[:limit] || 5

      data = expenses.offset(offset).limit(limit).map { |exp| exp.attributes }

      render json: { data: data, status: true, total: total, total_expenses: current_user.total_expenses, num_of_expenses: current_user.num_of_expenses }, status: :ok
    end

    def create
      expense = Expense.new(name: params[:name], cost: params[:cost])
      expense.made_on = Time.now
      expense.user = current_user

      if expense.save
        render json: { model: expense.attributes, status: true, total_expenses: current_user.total_expenses }, status: :ok
      else
        render json: { model: {}, status: false }, status: 400
      end
    end

    def update
      @expense.name = params[:name]
      @expense.cost = params[:cost]

      if @expense.save
        render json: { model: @expense.attributes, status: true, total_expenses: current_user.total_expenses, num_of_expenses: current_user.num_of_expenses }, status: :ok
      else
        render json: { model: {}, status: false }, status: 400
      end
    end

    def destroy
      @expense.active = false

      if @expense.save
        render json: { model: {}, status: true, total_expenses: current_user.total_expenses }, status: :ok
      else
        render json: { model: {}, status: false }, status: 400
      end
    end

    private

    def can_update_expense?
      @expense = Expense.find_by_id params[:id]
      if @expense.user_id != current_user.id
        render json: { message: "You don't have permission for the operation", status: false }, status: :forbidden
        return
      end
    end

  end
end
