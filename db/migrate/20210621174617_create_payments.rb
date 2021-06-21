class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :record, polymorphic: true, null: false
      t.integer :payment_method_id
      t.integer :payment_way_id
      t.integer :exchange_type_id
      t.decimal :total_amount, precision: 18, scale: 6
      t.datetime :payment_date
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
