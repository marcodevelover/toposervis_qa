class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :description
      t.string :abbreviation
      t.decimal :exchange_rate, precision: 18, scale: 6
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
