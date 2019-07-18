class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.references :author_blog, foreign_key: true
      t.string :title, :default => ""
      t.string :description, :default => ""
      t.boolean :published, :default => true
      t.string :titre, :default => ""
      t.text :content, :default => ""
      t.datetime :custom_date
      t.string :photos
      t.string :slug
      t.text :summary

      t.timestamps
    end
  end
end
