class AddElementsToHolidayRentings < ActiveRecord::Migration[5.2]
  def change
    add_column :holiday_rentings, :title, :string
    add_column :holiday_rentings, :slug, :string
    rename_column :holiday_rentings, :name, :titre
  end
end
