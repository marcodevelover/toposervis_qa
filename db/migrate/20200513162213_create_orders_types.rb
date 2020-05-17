class CreateOrdersTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_types do |t|
      t.references :service_order, null: false, foreign_key: true
      t.references :type_service_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
