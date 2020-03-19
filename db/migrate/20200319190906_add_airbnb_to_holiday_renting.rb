class AddAirbnbToHolidayRenting < ActiveRecord::Migration[5.2]
  def change
    add_column :holiday_rentings, :airbnb, :string
    add_column :holiday_rentings, :booking, :string
  end
end
