class ProductsController < ApplicationController

  # REVIEW: I'm guessing that you don't need to skip the set_current_user, it's ok if you don't use current_user, you can still run the method
  skip_before_action :set_current_order, only: [:create, :update, :create_product_option, :update_product_option, :delete_product_option]

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
    @pr_option = ProductOption.new
  end

  def new
    @product = Product.new
  end

  def create
    # REVIEW: Setting up the form to use a nested hash could simplify the arguments here
    @product = Product.new(name: params[:name], description: params[:description], image_url: params[:image_url])
    if @product.save
      redirect_to  admin_product_path(@product.id), notice: "The Product was added!"
    else
      render :new
    end
  end

  def update
    @pr_option = ProductOption.new
    @product = Product.find(params[:id])
    # REVIEW: Setting up the form to use a nested hash could simplify the arguments here
    @product.name = params[:name]
    @product.description = params[:description]
    @product.image_url = params[:image_url]
    if @product.save
      redirect_to admin_path, notice: "The product was updated"
    else
      render :edit
    end
  end

  def create_product_option
    # REVIEW: This should be in a product_options_controller.rb
    @product = Product.find(params[:id])
    @pr_option = ProductOption.new(product_id: @product.id, name: params[:name], price_in_cents: params[:price_in_cents])
    if @pr_option.save
      redirect_to admin_product_path(@product.id), notice: "The product option was added"
    else
      render :edit
    end
  end

  def update_product_option
    @product = Product.find(params[:id])
    @product_option = ProductOption.find(params[:pr_option_id])
    @product_option.name = params[:name]
    @product_option.price_in_cents = params[:price_in_cents]
    if @product_option.save
      redirect_to admin_path, notice: "The product option was updated"
    else
      @pr_option = ProductOption.new
      render :edit
    end
  end

  def delete_product_option
    @product_option = ProductOption.find(params[:pr_option_id])
    @product_option.destroy
    redirect_to admin_path, notice: "The product option was deleted"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_path, notice: "The product was deleted"
  end

end
