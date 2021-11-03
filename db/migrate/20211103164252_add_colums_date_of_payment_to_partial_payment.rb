class AddColumsDateOfPaymentToPartialPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :partial_payments, :date_of_payment, :datetime
  end
end
