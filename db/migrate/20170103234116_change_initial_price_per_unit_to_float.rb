class ChangeInitialPricePerUnitToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :promotions, :initial_price_per_unit, :float
  end
end
