class AddPhotoToPromotions < ActiveRecord::Migration[5.0]
  def change
    add_column :promotions, :photo_url, :string
  end
end
