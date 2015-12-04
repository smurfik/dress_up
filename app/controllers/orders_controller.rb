class OrdersController < ApplicationController

  def index
    set_current_user
  end

  def create
    @product = ProductOption.find(params[:product_option_id]).product
    raise
  end

end
