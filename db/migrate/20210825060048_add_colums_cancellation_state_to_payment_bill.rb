class AddColumsCancellationStateToPaymentBill < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_bills, :cancellation_state, :string, after: :bill_state
  end
end
