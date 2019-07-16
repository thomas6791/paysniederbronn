class BlogPostCategory < ApplicationRecord
  belongs_to :blog_post
  belongs_to :blog_category
end
