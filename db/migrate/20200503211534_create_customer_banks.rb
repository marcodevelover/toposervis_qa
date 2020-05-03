class CreateCustomerBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_banks do |t|
      t.string :beneficiary
      t.string :account
      t.string :clabe
      t.string :bank_name
      t.string :currency
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
