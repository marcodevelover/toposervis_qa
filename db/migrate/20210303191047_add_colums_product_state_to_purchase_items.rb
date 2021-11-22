class AddColumsProductStateToPurchaseItems < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_items, :product_state, :string
  end
end
