class AddColumnsRelatedToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :related, :string
  end
end
