class Order < ActiveRecord::Base

  validates :name, presence: true, if: :status_paid?
  validates :shipping_address, presence: true, if: :status_paid?
  validates :total, presence: true, if: :status_paid?

  has_many :items, dependent: :destroy
  belongs_to :user

  def status_paid?
    self.status == "paid"
  end

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
