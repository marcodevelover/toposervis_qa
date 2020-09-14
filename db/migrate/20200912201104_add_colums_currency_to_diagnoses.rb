class AddColumsCurrencyToDiagnoses < ActiveRecord::Migration[6.0]
  def change
    add_column :diagnoses, :currency_id, :integer
  end
end
