class AddColumsPaymentConditionToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :payment_condition, :string
  end
end
