class AddColumsDepotToPurchaseItem < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_items, :depot_id, :integer, default: 1
  end
end
