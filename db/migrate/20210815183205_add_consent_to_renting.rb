class AddConsentToRenting < ActiveRecord::Migration[5.2]
  def change
    add_column :rentings, :consent_cgv, :boolean, default: false
  end
end
