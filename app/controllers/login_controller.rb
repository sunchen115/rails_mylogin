class LoginController< ApplicationController


  def index
    @user = User.new
  end



  def create
    @user=User.new(user_param)
    is_auth = @user.try_login
    if !is_auth
      render "login/index"
    else
      session[:login_user_id] = @user.id
      redirect_to "/"
    end
  end

  def user_param
    params.require(:user).permit(:id , :name,:password)
  end
end