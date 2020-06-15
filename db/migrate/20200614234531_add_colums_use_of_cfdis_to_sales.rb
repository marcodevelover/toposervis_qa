class AddColumsUseOfCfdisToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :use_of_cfdi_id, :integer
  end
end
