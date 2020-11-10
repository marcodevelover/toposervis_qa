class AddColumsIsServiceOrderToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :is_service_order, :boolean
  end
end
