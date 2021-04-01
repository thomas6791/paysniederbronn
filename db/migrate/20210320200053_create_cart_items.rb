class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.monetize :subtotal

      t.timestamps
    end
  end
end
