class CartItem < ApplicationRecord
  belongs_to :product
  register_currency :eur
  monetize :sub_total_cents, as: "sub_total", with_currency: :eur
end
