class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.references :user, foreign_key: true
      t.string :name_of_the_store
      t.string :category
      t.text :description
      t.string :phone_number
      t.string :VAT_number
      t.timestamps
    end
  end
end
