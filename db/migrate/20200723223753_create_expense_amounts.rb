class CreateExpenseAmounts < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_amounts do |t|
      t.references :expense, null: false, foreign_key: true
      t.decimal :total, precision: 18, scale: 6
      t.decimal :iva, precision: 18, scale: 6
      t.decimal :ieps, precision: 18, scale: 6
      t.decimal :total_with_tax, precision: 18, scale: 6

      t.timestamps
    end
  end
end
