class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.datetime :date
      t.references :payment_method, null: false, foreign_key: true
      t.string :purchase_order
      t.string :last_digit
      t.string :project
      t.references :account, null: false, foreign_key: true
      t.references :category_type, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true
      t.references :document_type, null: false, foreign_key: true
      t.string :folio
      t.text :comment
      t.string :concept
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
