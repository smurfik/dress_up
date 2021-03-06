class UsersController < ApplicationController

  skip_before_action :set_current_user, only: [:create]

  def sign_in
    if set_current_user
      redirect_to root_path
    end
  end

  def sign_in_user
    @user = User.find_by(email: params[:email])
    if @user &&  @user.authenticate(params[:password]) && !@user.admin
      session[:user_id] = @user.id
      @current_order.user_id = session[:user_id]
      @current_order.save
      redirect_to root_path, notice: "Welcome!"
    elsif @user.admin
      session[:user_id] = @user.id
      redirect_to admin_path
    else
      redirect_to sign_in_path, notice: "Wrong username or password. Try again!"
    end
  end

  def sign_up
    if set_current_user
      redirect_to root_path
    end
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      @current_order.user_id = session[:user_id]
      @current_order.save
      redirect_to root_path, notice: "Welcome!"
    else
      render :sign_up
    end
  end

  def sign_out
    session.delete(:user_id)
    session.delete(:order_id)
    redirect_to root_path, notice: "See you soon!"
  end

end
