module Api
  class UsersController < ApplicationController

    before_filter :check_user_login

    def show
      if current_user
        render json: { model: current_user.attributes, status: true, message: 'Success' }, status: :ok
      else
        render json: { model: nil, status: false, message: 'Success' }, status: :forbidden
      end
    end

  end
end
