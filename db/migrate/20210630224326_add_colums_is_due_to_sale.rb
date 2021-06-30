class AddColumsIsDueToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :is_due, :boolean
  end
end
