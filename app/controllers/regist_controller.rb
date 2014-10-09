class RegistController < ApplicationController


  def index
    @user = User.new()
  end


  def create()
    @user = User.new(user_param)
    if
     @user.save
      redirect_to "/login"
    else
      render "index"
    end
  end

  def user_param
    params.require(:user).permit(:id , :name,:password)
  end
end

