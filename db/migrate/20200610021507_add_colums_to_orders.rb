class AddColumsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :is_tax, :boolean
  end
end
