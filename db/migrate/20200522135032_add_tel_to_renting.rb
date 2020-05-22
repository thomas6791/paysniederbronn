class AddTelToRenting < ActiveRecord::Migration[5.2]
  def change
    add_column :holiday_rentings, :tel, :string
    add_column :holiday_rentings, :email, :string
  end
end
