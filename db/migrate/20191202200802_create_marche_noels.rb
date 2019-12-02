class CreateMarcheNoels < ActiveRecord::Migration[5.2]
  def change
    create_table :marche_noels do |t|

      t.timestamps
    end
  end
end
