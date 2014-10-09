class WelcomeController < ApplicationController
  before_filter :authenticate
  def authenticate
    if session[:login_user_id].nil?
      redirect_to '/login'
    end
    @user = session[:login_user_id].nil? ?  User.new : User.find_by(id: session[:login_user_id])
  end

  def index
  end
end
