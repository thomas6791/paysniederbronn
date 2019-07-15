class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :titre
      t.text :content
      t.string :summary

      t.timestamps
    end
  end
end
