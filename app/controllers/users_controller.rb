class UsersController < ApplicationController

  def sign_in
    set_current_user
  end

  def sign_up
    set_current_user
  end

  def sign_out
    session.delete(:user_id)
    redirect_to root_path
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :sign_up
    end
  end

end
