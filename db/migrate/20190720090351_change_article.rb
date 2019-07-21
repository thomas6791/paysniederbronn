class ChangeArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :slug, :string
    add_column :articles, :photos, :string
  end
end
