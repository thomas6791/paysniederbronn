class AddPricesToHolidayRentings < ActiveRecord::Migration[5.2]
  def change
     add_monetize :rentings, :price_day, currency: { present: false }
     add_monetize :rentings, :price_week, currency: { present: false }
  end
end
