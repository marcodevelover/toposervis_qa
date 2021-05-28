class CreateQuotationServices < ActiveRecord::Migration[6.0]
  def change
    create_table :quotation_services do |t|
      t.string :folio
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
      t.datetime :canceled_at

      t.timestamps
    end
  end
end
