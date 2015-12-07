class Order < ActiveRecord::Base

  has_many :items
  belongs_to :user

  def total_price
    total_price = 0
    self.items.each do |item|
      total_price += item.total_item_price
    end
    total_price
  end

  def formatted_price
    price = self.total_price/100.to_f
    "$#{price}"
  end

end
