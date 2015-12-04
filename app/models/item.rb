class Item < ActiveRecord::Base
  belongs_to :product_option
  belongs_to :order
end
