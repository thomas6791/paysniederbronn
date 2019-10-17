class AddElementsToRentings < ActiveRecord::Migration[5.2]
  def change
    add_column :holiday_rentings, :website, :string
    add_column :holiday_rentings, :city, :string
    add_column :holiday_rentings, :zip_code, :string
    add_column :holiday_rentings, :address, :string
    add_column :holiday_rentings, :latitude, :float
    add_column :holiday_rentings, :longitude, :float
  end
end
