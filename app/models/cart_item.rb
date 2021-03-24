class CartItem < ApplicationRecord
  belongs_to :product
  has_one :order
  register_currency :eur
  monetize :subtotal_cents, as: "subtotal", with_currency: :eur
end
