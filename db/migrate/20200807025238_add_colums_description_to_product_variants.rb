class AddColumsDescriptionToProductVariants < ActiveRecord::Migration[6.0]
  def change
    add_column :product_variants, :product_description, :string
  end
end
