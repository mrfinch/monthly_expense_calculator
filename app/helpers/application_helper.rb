module ApplicationHelper

  def check_user_login
    unless user_signed_in?
      render json: { message: 'User login required', status: false, model: {} }, status: :forbidden
      return
    end
  end

end
