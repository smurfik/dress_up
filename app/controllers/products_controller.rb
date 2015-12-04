class ProductsController < ApplicationController

  def index
    set_current_user
    set_current_order
    @products = Product.all
  end

  def show
    set_current_user
    set_current_order
    @product = Product.find(params[:id])
    @product_options = @product.product_options
  end

end
