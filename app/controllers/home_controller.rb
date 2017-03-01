class HomeController < ApplicationController

  def index
    render inline: 'Hello'
  end

end
