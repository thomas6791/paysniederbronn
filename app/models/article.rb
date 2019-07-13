class Article < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories
end
