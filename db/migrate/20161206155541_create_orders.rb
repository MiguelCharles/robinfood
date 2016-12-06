class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :promotion, foreign_key: true
      t.integer :quantity_ordered
      t.string :status

      t.timestamps
    end
  end
end
