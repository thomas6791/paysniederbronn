class AddPricesToHolidayRentings < ActiveRecord::Migration[5.2]
  def change
     add_monetize :rentings, :price_day
     add_monetize :rentings, :price_week
  end
end
