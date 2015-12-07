class OrdersController < ApplicationController

  def index
  end

  def create
    @product_option = ProductOption.find(params[:product_option_id])
    @item = Item.create(order_id: @current_order.id, product_option_id: @product_option.id, price: @product_option.price_in_cents, quantity: params[:quantity])
    redirect_to cart_path, notice: "The item was added to the cart"
  end

  def show
  end

  def update
    raise
  end

end
