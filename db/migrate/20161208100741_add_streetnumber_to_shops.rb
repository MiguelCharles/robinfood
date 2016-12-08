class AddStreetnumberToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :street_number, :integer
  end
end
