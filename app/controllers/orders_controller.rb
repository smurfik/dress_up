class OrdersController < ApplicationController

  skip_before_action :set_current_user, only: [:create]

  def index
  end

  def create
    @product_option = ProductOption.find(params[:product_option_id])
    # REVIEW: breaking line 11 onto multiple lines would be recommended since it's so long
    @item = Item.create(order_id: @current_order.id, product_option_id: @product_option.id, price: @product_option.price_in_cents, quantity: params[:quantity])
    redirect_to cart_path, notice: "The item was added to the cart"
  end

  def show
  end

  def view
    @complete_order = Order.find(params[:id])
    if @complete_order.user_id != session[:user_id]
      redirect_to root_path
    end
  end

  def account
    @orders = @current_user.orders.order("id desc")
  end

  def display
    # REVIEW: Doesn't really matter but `.all` isn't needed here since you are using `.order`
    #         `.order` does the same thing as .all, but it also orders the records
    @orders = Order.all.order("id desc")
  end

  def update
    @current_order.name = params[:name]
    @current_order.shipping_address = params[:shipping_address]
    @current_order.status = "paid"
    @current_order.total = @current_order.total_price
    if @current_order.save
      session.delete(:order_id)
      redirect_to order_path
    else
      render :show
    end
  end

  def update_status
    @order = Order.find(params[:id])
    @order.status = "shipped"
    @order.save
    redirect_to admin_order_path, notice: "The order #{@order.id} is updated"
  end

  def update_item
    # REVIEW: Really nit picky, but you may want to consider putting this action in a `items_controller`
    #         since that is what it's updating. Same with the delete_item below
    @item = Item.find(params[:id])
    @item.quantity = params[:quantity]
    @item.save
    redirect_to cart_path, notice: "The quantity was successfully updated!"
  end

  def delete_item
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to cart_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    if @current_user.admin
      redirect_to admin_order_path, notice: "The order was successfully deleted!"
    else
      redirect_to account_path, notice: "The order was successfully deleted!"
    end
  end

end
