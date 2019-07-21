class AddForeignKeyToArticlesCategory < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :articles, :categories
  end
end
