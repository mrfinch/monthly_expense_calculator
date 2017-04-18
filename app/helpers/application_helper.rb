module ApplicationHelper

  def check_user_login
    unless user_signed_in?
      render json: { message: 'User login required', status: false }, status: :forbidden
      return
    end
  end

end
