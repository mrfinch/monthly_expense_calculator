class AuthController < ApplicationController

  def signup
    email = params[:email].try(:strip)
    password = params[:password].try(:strip)
    name = params[:fullname].try(:strip)

    message = if email.blank?
                'Email is empty'
              elsif password.blank?
                'Password is empty'
              elsif name.blank?
                'Name is empty'
              else
                nil
              end

    user = User.find_by_email email

    message = 'User already exists' if user.present?

    if message.present?
      render json: { message: message, status: false }, status: 400
      return
    end

    user = User.new(email: email, password: password, name: name)
    # set confirmation_url to a new endpoint for confirmation
    if user.save
      render json: { message: 'Success', status: true }, status: 200
    else
      render json: { message: user.errors.full_messages, status: false }, status: 400
    end

  end

  def login
    email = params[:email].try(:strip)
    password = params[:password].try(:strip)

    message = if email.blank?
                'Email is empty'
              elsif password.blank?
                'Password is empty'
              else
                nil
              end

    user = User.find_by_email email

    message = 'Login / password match failed' if user.blank?

    if user.valid_password?(password)
      sign_in(:user, user)
    else
      message = 'Login / password match failed'
    end

    if message.present?
      render json: { message: message, status: false }, status: 400
    else
      render json: { message: 'Success', status: true }, status: 200
    end

  end

  def logout
    sign_out(:user)

    render json: { message: 'Success', status: true }, status: 200
  end

end
