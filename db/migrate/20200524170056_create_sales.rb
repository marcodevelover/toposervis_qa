class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.references :record, polymorphic: true, index: true
      t.string :folio
      t.references :payment_method, null: false, foreign_key: true
      t.references :payment_way, null: false, foreign_key: true
      t.string :state
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
