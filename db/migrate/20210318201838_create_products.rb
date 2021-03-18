class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :commerce, foreign_key: true
      t.integer :price_cents
      t.integer :quantity_max
      t.jsonb :availability, null: false, default: {}

      t.timestamps
    end
  end
end
