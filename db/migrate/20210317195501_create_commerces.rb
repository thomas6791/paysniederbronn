class CreateCommerces < ActiveRecord::Migration[5.2]
  def change
    create_table :commerces do |t|
      t.string :name
      t.text :description
      t.string :summary
      t.string :address
      t.string :city
      t.string :zip_code
      t.float :latitude
      t.float :longitude
      t.boolean :published
      t.string :title
      t.string :slug
      t.string :category
      t.string :tel
      t.string :email
      t.string :website
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
