class CreateStockItems < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_items do |t|
      t.references :product_variant, null: false, foreign_key: true
      t.decimal :stock, precision: 10, scale: 2

      t.timestamps
    end
  end
end
