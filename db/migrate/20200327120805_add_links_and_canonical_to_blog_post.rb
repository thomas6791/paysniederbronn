class AddLinksAndCanonicalToBlogPost < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :canonical, :string
    add_column :blog_posts, :link_left, :string
    add_column :blog_posts, :link_right, :string
  end
end
