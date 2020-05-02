class CreateProductVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :product_variants do |t|
      t.string :code
      t.string :code_alternative
      t.string :stocking_time
      t.decimal :cost_price, precision: 10, scale: 2
      t.references :currency, null: false, foreign_key: true
      t.decimal :amount_public, precision: 10, scale: 2
      t.decimal :amount_provider, precision: 10, scale: 2
      t.decimal :amount_shipping, precision: 10, scale: 2
      t.integer :stock_min
      t.integer :stock_max
      t.references :product, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
