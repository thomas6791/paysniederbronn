class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :state
      t.monetize :amount
      t.string :checkout_session_id
      t.date :delivery_date

      t.timestamps
    end
  end
end
