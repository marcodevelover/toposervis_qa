class AddColumsDepreciationToProductVariant < ActiveRecord::Migration[6.0]
  def change
    add_column :product_variants, :depreciation, :decimal, precision: 18, scale: 6
  end
end
