class AddForeignKeyUserToRenting < ActiveRecord::Migration[5.2]
  def change
    add_reference :rentings, :user, foreign_key: true
  end
end
