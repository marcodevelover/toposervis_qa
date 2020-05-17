class CreateServiceOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :service_orders do |t|
      t.datetime :date_admission
      t.string :folio
      t.references :customer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :serie
      t.string :brand
      t.string :model
      t.int :created_by_id
      t.text :observation
      t.datetime :deleted_at
      t.string :status

      t.timestamps
    end
  end
end
