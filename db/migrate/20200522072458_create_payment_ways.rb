class CreatePaymentWays < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_ways do |t|
      t.string :name
      t.string :description
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
