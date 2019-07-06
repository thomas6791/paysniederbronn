class CreateHolidayRentings < ActiveRecord::Migration[5.2]
  def change
    create_table :holiday_rentings do |t|
      t.string :name
      t.text :description
      t.string :summary

      t.timestamps
    end
  end
end
