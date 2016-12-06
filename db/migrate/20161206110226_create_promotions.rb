class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.references :shop, foreign_key: true
      t.string :title
      t.string :product_type
      t.integer :initial_quantity
      t.string :unit
      t.integer :initial_price_per_unit
      t.integer :price_after_promotion_per_unit
      t.integer :remaining_quantity
      t.boolean :promotion_status
      t.integer :digits_code
      t.datetime :validity

      t.timestamps
    end
  end
end
