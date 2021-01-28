class AddPricecureToHolidayRentings < ActiveRecord::Migration[5.2]
  def change
    add_monetize :rentings, :price_cure, currency: { present: false }
  end
end
