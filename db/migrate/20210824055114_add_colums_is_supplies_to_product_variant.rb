class AddColumsIsSuppliesToProductVariant < ActiveRecord::Migration[6.0]
  def change
    add_column :product_variants, :is_supplies, :boolean
  end
end
