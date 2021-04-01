class AddReferencesToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_items, :order, foreign_key: true
    add_reference :orders, :commerce, foreign_key: true
  end
end
