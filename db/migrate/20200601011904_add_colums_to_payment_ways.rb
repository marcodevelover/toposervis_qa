class AddColumsToPaymentWays < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_ways, :payment_way_key, :string
  end
end
