class AddColumsUuidToPaymentBill < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_bills, :bill_key, :string
    add_column :payment_bills, :bill_state, :string
    add_column :payment_bills, :uuid, :string
    add_column :payment_bills, :bill_folio, :string
  end
end
