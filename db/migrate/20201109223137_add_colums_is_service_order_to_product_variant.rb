class AddColumsIsServiceOrderToProductVariant < ActiveRecord::Migration[6.0]
  def change
    add_column :product_variants, :is_service_order, :boolean
  end
end
