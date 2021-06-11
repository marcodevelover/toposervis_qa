class AddColumsIsServiceToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :is_service, :boolean
  end
end
