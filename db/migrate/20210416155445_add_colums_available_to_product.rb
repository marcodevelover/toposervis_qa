class AddColumsAvailableToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :available_for_sale, :boolean
  end
end
