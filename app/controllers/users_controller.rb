class UsersController < ApplicationController

  def sign_in
  end

  def sign_up
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    @user.save
    redirect_to root_path
  end

end
