class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.references :user, foreign_key: true
      t.string :name_of_the_store
      t.string :category
      t.text :description
      t.string :phone_number
      t.string :VAT_number
      geocoded_by :address
      after_validation :geocode, if: :address_changed?
      t.timestamps
    end
  end
end
