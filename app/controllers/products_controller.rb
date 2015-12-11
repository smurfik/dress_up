class ProductsController < ApplicationController

  skip_before_action :set_current_order, only: [:create, :update]

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
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name]
    @product.description = params[:description]
    @product.image_url = params[:image_url]
    if @product.save
      redirect_to admin_path, notice: "The product was updated"
    else
      render :edit
    end
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], description: params[:description], image_url: params[:image_url])
    if @product.save
      redirect_to  admin_product_path(@product.id), notice: "The Product was added!"
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_path, notice: "The product was deleted"
  end

end
