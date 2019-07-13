class CreatePostCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :post_categories do |t|
      t.references :category, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
