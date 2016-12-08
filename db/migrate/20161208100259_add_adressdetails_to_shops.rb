class AddAdressdetailsToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :zip_code, :integer
    add_column :shops, :city, :string
    add_column :shops, :country, :string
    add_column :shops, :full_address, :string
    add_column :shops, :address, :string
    add_column :shops, :picture_of_the_shop, :string
  end
end
