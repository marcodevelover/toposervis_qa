class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :folio
      #t.string :reference
      t.datetime :date
      t.text :observation
      #t.references :payment_method, null: false, foreign_key: true
      #t.references :payment_way, null: false, foreign_key: true
      t.decimal :subtotal, precision: 18, scale: 6
      t.decimal :total, precision: 18, scale: 6
      t.decimal :adjustment_total, precision: 18, scale: 6
      t.decimal :tax, precision: 18, scale: 6
      t.decimal :tax_total, precision: 18, scale: 6
      t.decimal :tax_item_total, precision: 18, scale: 6
      t.string :state
      t.datetime :validity
      t.references :currency, null: false, foreign_key: true
      t.decimal :exchange_rate, precision: 18, scale: 6
      t.references :customer, null: false, foreign_key: true
      t.text :condition
      t.integer :created_by_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
