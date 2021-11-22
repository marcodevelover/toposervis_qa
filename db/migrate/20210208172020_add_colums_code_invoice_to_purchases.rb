class AddColumsCodeInvoiceToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :code_invoice, :string
  end
end
