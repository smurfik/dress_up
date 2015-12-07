class Order < ActiveRecord::Base

  validates :name, presence: true
  validates :shipping_address, presence: true
  validates :total, presence: true

  has_many :items, dependent: :destroy
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
