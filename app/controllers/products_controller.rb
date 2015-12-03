class ProductsController < ApplicationController

  def index
    set_current_user
    @products = Product.all
  end

  def show
    set_current_user
    @product = Product.find(params[:id])
    @product_options = @product.product_options
  end

end
