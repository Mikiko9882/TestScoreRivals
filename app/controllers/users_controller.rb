class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end
    
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name, :nickname, :grade_and_class)
  end
end
