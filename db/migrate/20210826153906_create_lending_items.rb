class CreateLendingItems < ActiveRecord::Migration[6.0]
  def change
    create_table :lending_items do |t|
      t.references :record, polymorphic: true, null: false
      t.references :product_variant, null: false, foreign_key: true
      t.string :name
      t.integer :quantity
      t.decimal :unit_price, precision: 18, scale: 6
      t.decimal :total, precision: 18, scale: 6
      t.string :currency
      t.decimal :cost_price, precision: 18, scale: 6
      t.decimal :tax_item_total, precision: 18, scale: 6
      t.decimal :tax_total, precision: 18, scale: 6
      t.decimal :tax, precision: 18, scale: 6
      t.decimal :adjustment_total, precision: 18, scale: 6
      t.string :number_serie
      t.string :number_procedure
      t.string :number_part
      t.text :observation
      t.string :unit
      t.string :state

      t.timestamps
    end
  end
end
