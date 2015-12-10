class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @product_options = @product.product_options
  end

  def show_products
    @products = Product.all
  end

  def edit
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_path, notice: "The product was deleted"
  end

end
