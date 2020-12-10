class CreateRandonnees < ActiveRecord::Migration[5.2]
  def change
    create_table :randonnees do |t|
      t.string :titre
      t.text :description
      t.string :slug
      t.string :title
      t.text :description
      t.string :summary
      t.string :duree
      t.float :distance
      t.string :difficulty
      t.string :zip_code
      t.string :city
      t.string :metadescription

      t.timestamps
    end
  end
end
