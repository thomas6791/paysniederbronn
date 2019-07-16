class BlogPost < ApplicationRecord
  belongs_to :author_blog
  has_many :blog_post_categories
  has_many :blog_categories, through: :blog_post_categories
end
