class UsersController < ApplicationController

  def sign_in
  end

  def sign_up
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save
      redirect_to root_path
    else
      render :sign_up
    end
  end

end
