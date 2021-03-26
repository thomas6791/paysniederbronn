class AddElementsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :email, :string
    add_column :orders, :tel, :string
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :rgpd, :boolean; default: false
  end
end
