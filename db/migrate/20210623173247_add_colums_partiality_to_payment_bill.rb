class AddColumsPartialityToPaymentBill < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_bills, :partiality_number, :integer
    add_column :payment_bills, :previous_balance_amount, :decimal, precision: 18, scale: 6
    add_column :payment_bills, :amount_paid, :decimal, precision: 18, scale: 6
    add_column :payment_bills, :unpaid_balance_amount, :decimal, precision: 18, scale: 6
  end
end
