class AddColumsStatusToProductStock < ActiveRecord::Migration[6.0]
  def change
    add_column :product_stocks, :status, :string
  end
end
