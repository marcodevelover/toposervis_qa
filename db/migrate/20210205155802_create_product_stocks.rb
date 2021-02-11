class CreateProductStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :product_stocks do |t|
      t.integer :product_variant_id
      t.string :serial_number
      t.integer :created_by_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
