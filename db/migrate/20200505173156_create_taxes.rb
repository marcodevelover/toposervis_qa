class CreateTaxes < ActiveRecord::Migration[6.0]
  def change
    create_table :taxes do |t|
      t.string :name
      t.string :description
      t.decimal :amount, precision: 18, scale: 6
      t.decimal :value, precision: 18, scale: 6
      t.boolean :default
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
