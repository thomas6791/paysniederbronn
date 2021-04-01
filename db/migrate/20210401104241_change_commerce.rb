class ChangeCommerce < ActiveRecord::Migration[5.2]
  def change
    remove_column :commerces, :slug, :string
  end
end
