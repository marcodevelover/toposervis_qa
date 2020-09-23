class AddColumsInteriorNumberToCustomerAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :customer_addresses, :interior_number, :string
  end
end
