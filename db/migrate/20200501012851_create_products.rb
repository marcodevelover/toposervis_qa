class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.string :description
      t.string :comment
      t.references :product_line, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
