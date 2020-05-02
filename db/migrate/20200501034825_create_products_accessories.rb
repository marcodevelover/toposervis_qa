class CreateProductsAccessories < ActiveRecord::Migration[6.0]
  def change
    create_table :products_accessories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :accessory, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
