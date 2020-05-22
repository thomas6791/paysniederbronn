class AddTelToRenting < ActiveRecord::Migration[5.2]
  def change
    add_column :rentings, :tel, :string
  end
end
