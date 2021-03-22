class Product < ApplicationRecord
  belongs_to :commerce
  has_many :cart_items
  has_one_attached :photo
end
