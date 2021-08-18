class AddColumnsRelationToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :relation_bill_id, :integer
  end
end
