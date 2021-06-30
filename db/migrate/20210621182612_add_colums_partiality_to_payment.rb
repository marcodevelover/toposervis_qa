class AddColumsPartialityToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :partiality_number, :integer
    add_column :payments, :previous_balance_amount, :decimal, precision: 18, scale: 6
    add_column :payments, :amount_paid, :decimal, precision: 18, scale: 6
    add_column :payments, :unpaid_balance_amount, :decimal, precision: 18, scale: 6
  end
end
