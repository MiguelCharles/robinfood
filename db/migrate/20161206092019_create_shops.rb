class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.references :user, foreign_key: true
      t.string :category
      t.text :description
      t.string :phone_number
      t.string :VAT_number

      t.timestamps
    end
  end
end
