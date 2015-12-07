class Product < ActiveRecord::Base

  has_many :product_options, dependent: :destroy
end
