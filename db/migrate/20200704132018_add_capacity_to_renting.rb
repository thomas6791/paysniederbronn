class AddCapacityToRenting < ActiveRecord::Migration[5.2]
  def change
    add_column :rentings, :capacity, :integer
    add_column :rentings, :animals, :boolean, :default => false
    add_column :rentings, :family, :boolean, :default => false
    add_column :rentings, :cure, :boolean, :default => false
    add_column :rentings, :niederbronn_dist, :float, :default => ""
    add_column :rentings, :morsbronn_dist, :float, :default => ""
  end
end
