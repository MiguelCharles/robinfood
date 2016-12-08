class AddPhotoToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :photo_url, :string
  end
 end
