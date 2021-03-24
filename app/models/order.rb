class Order < ApplicationRecord
  monetize :amount_cents
  has_many :cart_items
end
