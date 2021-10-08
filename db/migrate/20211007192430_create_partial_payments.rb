class CreatePartialPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :partial_payments do |t|
      t.references :service_order, null: false, foreign_key: true
      t.decimal :amount, precision: 18, scale: 6

      t.timestamps
    end
  end
end
