class ChangeMarkUpToFloat < ActiveRecord::Migration
  def change
    change_column :promotions, :price_after_promotion_per_unit, :float
  end
end
