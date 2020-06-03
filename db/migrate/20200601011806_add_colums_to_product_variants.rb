class AddColumsToProductVariants < ActiveRecord::Migration[6.0]
  def change
    add_column :product_variants, :product_key, :string
  end
end
