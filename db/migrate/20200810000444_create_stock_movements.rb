class CreateStockMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_movements do |t|
      t.references :stock_item, null: false, foreign_key: true
      t.string :folio
      t.string :description
      t.decimal :stock, precision: 10, scale: 2
      t.integer :quantity
      t.decimal :total, precision: 18, scale: 6
      t.references :currency, null: false, foreign_key: true
      t.decimal :cost_price, precision: 18, scale: 6
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
