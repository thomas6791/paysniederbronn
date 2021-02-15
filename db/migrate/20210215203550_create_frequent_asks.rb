class CreateFrequentAsks < ActiveRecord::Migration[5.2]
  def change
    create_table :frequent_asks do |t|
      t.references :frequentasked, polymorphic: true
      t.boolean "public", null: false, default: true

      t.timestamps
    end
  end
end
