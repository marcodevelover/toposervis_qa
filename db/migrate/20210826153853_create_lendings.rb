class CreateLendings < ActiveRecord::Migration[6.0]
  def change
    create_table :lendings do |t|
      t.string :folio
      t.string :name
      t.string :description
      t.string :responsible
      t.datetime :date
      t.text :observation
      t.decimal :subtotal, precision: 18, scale: 6
      t.decimal :total, precision: 18, scale: 6
      t.decimal :adjustment_total, precision: 18, scale: 6
      t.decimal :tax, precision: 18, scale: 6
      t.decimal :tax_total, precision: 18, scale: 6
      t.decimal :tax_item_total, precision: 18, scale: 6
      t.string :state
      t.datetime :validity
      t.integer :currency_id
      t.decimal :exchange_rate, precision: 18, scale: 6
      t.integer :receipt_type_id
      t.integer :entry_code_id
      t.integer :provider_id
      t.integer :created_by_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
