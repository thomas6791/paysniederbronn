class Commerce < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :orders
  extend FriendlyId
  friendly_id :name, use: :slugged
end
