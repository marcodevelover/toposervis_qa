class CreateProductsDeliverables < ActiveRecord::Migration[6.0]
  def change
    create_table :products_deliverables do |t|
      t.references :product, null: false, foreign_key: true
      t.references :deliverable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
