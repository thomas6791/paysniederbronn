class AddPricesToHolidayRentings < ActiveRecord::Migration[5.2]
  def change
    add_column :rentings, :price_day, :float
    add_column :rentings, :price_day, :float
  end
end
