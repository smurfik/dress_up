class ProductOption < ActiveRecord::Base

  belongs_to :product

  validates :name, presence: true
  validates :price_in_cents, presence: true, numericality: { only_integer: true }

  def dropdown_view
    "#{name} #{formatted_price}"
  end

  def formatted_price
    price = price_in_cents/100.to_f
    "$#{price}"
  end

end
