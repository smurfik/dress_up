class Order < ActiveRecord::Base

  validates :name, presence: true, if: :status_complete?
  validates :shipping_address, presence: true, if: :status_complete?
  validates :total, presence: true, if: :status_complete?

  has_many :items, dependent: :destroy
  belongs_to :user

  def status_complete?
    self.status == "complete"
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
