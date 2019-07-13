class Category < ApplicationRecord
  has_many :post_categories
  has_many :articles, through: :post_categories
end
