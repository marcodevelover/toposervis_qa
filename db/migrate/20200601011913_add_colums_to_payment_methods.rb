class AddColumsToPaymentMethods < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_methods, :payment_method_key, :string
  end
end
