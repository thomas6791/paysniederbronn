class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :post_categories, :articles
    remove_foreign_key :post_categories, :categories
  end
end
