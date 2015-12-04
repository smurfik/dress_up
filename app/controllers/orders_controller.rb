class OrdersController < ApplicationController

  def index
    set_current_user
    set_current_order
  end

  def create
    @product_option = ProductOption.find(params[:product_option_id])
    if set_current_order
      @order = Order.find(session[:order_id])
      @item = Item.create(order_id: @order.id, product_option_id: @product_option.id, price: @product_option.price_in_cents, quantity: params[:quantity])
      redirect_to cart_path, notice: "The item was added to the cart"
    else
      @order = Order.create()
      session[:order_id] = @order.id
      @item = Item.create(order_id: @order.id, product_option_id: @product_option.id, price: @product_option.price_in_cents, quantity: params[:quantity])
      redirect_to cart_path, notice: "The item was added to the cart"
    end
  end

end
