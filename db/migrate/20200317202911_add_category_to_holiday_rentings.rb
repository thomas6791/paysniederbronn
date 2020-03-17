class AddCategoryToHolidayRentings < ActiveRecord::Migration[5.2]
  def change
    add_column :holiday_rentings, :category, :string
  end
end
