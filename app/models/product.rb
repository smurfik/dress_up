class Product < ActiveRecord::Base

  has_many :product_options, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :image_url, presence: true, uniqueness: true

end
