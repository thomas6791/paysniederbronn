class CreateRentingCats < ActiveRecord::Migration[5.2]
  def change
    create_table :renting_cats do |t|
      t.references :renting, foreign_key: true
      t.references :renting_category, foreign_key: true

      t.timestamps
    end
  end
end
