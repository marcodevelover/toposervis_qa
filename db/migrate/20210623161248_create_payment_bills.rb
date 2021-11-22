class CreatePaymentBills < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_bills do |t|
      t.integer :sale_id
      t.integer :payment_method_id
      t.integer :payment_way_id
      t.integer :exchange_type_id
      t.datetime :deleted_at
      t.decimal :total_amount, precision: 18, scale: 6
      t.datetime :payment_date

      t.timestamps
    end
  end
end
