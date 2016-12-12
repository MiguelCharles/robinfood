class RemoveFullAddressFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :full_address
  end
end
