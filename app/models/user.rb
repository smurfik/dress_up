class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\w@\w/ }

  has_many :orders
end
