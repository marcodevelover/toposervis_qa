class AddColumsToProductVariant < ActiveRecord::Migration[6.0]
  def change
    add_column :product_variants, :location, :string
    add_column :product_variants, :execution_time, :string
  end
end
