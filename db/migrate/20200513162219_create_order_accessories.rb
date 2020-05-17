class CreateOrderAccessories < ActiveRecord::Migration[6.0]
  def change
    create_table :order_accessories do |t|
      t.references :service_order, null: false, foreign_key: true
      t.string :accessory
      t.integer :quantity

      t.timestamps
    end
  end
end
