class AddMinquantityToPromotions < ActiveRecord::Migration[5.0]
  def change
    add_column :promotions, :min_quantity, :integer
  end
end
