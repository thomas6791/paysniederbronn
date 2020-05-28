class AddElementsToRenting < ActiveRecord::Migration[5.2]
  def change
    add_column :rentings, :titre, :string
    add_column :rentings, :description, :text
    add_column :rentings, :summary, :string
    add_column :rentings, :website, :string
    add_column :rentings, :address, :string
    add_column :rentings, :zip_code, :string
    add_column :rentings, :city, :string
    add_column :rentings, :longitude, :float
    add_column :rentings, :latitude, :float
    add_column :rentings, :published, :boolean
    add_column :rentings, :title, :string
    add_column :rentings, :slug, :string
    add_column :rentings, :category, :string
    add_column :rentings, :airbnb, :string
    add_column :rentings, :booking, :string
    add_column :rentings, :tel, :string
    add_column :rentings, :email, :string
  end
end
