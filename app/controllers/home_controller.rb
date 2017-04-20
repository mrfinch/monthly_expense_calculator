class HomeController < ApplicationController

  def index
    @loggedin_user = user_signed_in? ? current_user : nil
  end

end
