class CreateRentings < ActiveRecord::Migration[5.2]
  def change
    create_table :rentings do |t|

      t.timestamps
    end
  end
end
