class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :record, polymorphic: true, index: true
      t.references :product_variant, null: false, foreign_key: true
      #t.references :quotation, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price, precision: 18, scale: 6
      t.decimal :total, precision: 18, scale: 6
      t.string :currency
      t.decimal :cost_price, precision: 18, scale: 6
      t.decimal :tax_item_total, precision: 18, scale: 6
      t.decimal :tax_total, precision: 18, scale: 6
      t.decimal :tax, precision: 18, scale: 6
      t.decimal :adjustment_total, precision: 18, scale: 6

      t.timestamps
    end
  end
end
