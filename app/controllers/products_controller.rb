class ProductsController < ApplicationController

  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    @products = Product.all
  end

  def show
  end

end
