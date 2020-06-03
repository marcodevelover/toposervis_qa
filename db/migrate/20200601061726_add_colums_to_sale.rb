class AddColumsToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :bill_state, :string
  end
end
