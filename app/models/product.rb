class Product < ApplicationRecord
  belongs_to :commerce
  has_many :cart_items
end
