class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_user, except: [:sign_in_user, :sign_out, :create]
  before_action :set_current_order

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def set_current_order
    if session[:order_id]
      @current_order = Order.find(session[:order_id])
    else
      @current_order = Order.create()
      session[:order_id] = @current_order.id
    end
  end

end
