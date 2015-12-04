class OrdersController < ApplicationController

  def index
    set_current_user
    @cart
  end

  def create
    @cart = []
    @product = ProductOption.find(params[:product_option_id]).product
    @cart << ProductOption.find(params[:product_option_id])
    raise
    render :index
  end

end
