class AddColumsPaymentWayToPurchase < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :payment_way_id, :integer
  end
end
