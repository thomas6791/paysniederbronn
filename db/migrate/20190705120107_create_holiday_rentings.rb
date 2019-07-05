class CreateHolidayRentings < ActiveRecord::Migration[5.2]
  def change
    create_table :holiday_rentings do |t|
      t.string :name
      t.string :summary
      t.text :description

      t.timestamps
    end
  end
end
