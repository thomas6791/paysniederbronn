class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :state
      t.monetize :amount
      t.date :delivery_date

      t.timestamps
    end
  end
end
