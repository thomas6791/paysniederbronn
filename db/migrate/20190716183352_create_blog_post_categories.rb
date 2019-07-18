class CreateBlogPostCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_post_categories do |t|
      t.references :blog_post, foreign_key: true
      t.references :blog_category, foreign_key: true

      t.timestamps
    end
  end
end
