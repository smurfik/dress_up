class Item < ActiveRecord::Base
  belongs_to :product_option
  belongs_to :order

  def total_item_price
    quantity.to_i * price
  end

  def formatted_price
    price = total_item_price/100.to_f
    "$#{price}"
  end

end
