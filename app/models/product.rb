class Product < ApplicationRecord
  serialize :hash
  belongs_to :commerce
  has_many :cart_items
  has_one_attached :photo
  register_currency :eur
  monetize :price_cents, as: "price", with_currency: :eur
end
