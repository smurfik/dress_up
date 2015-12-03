class ProductsController < ApplicationController

  def index
    set_current_user
    @products = Product.all
  end

  def show
    set_current_user
  end

end
