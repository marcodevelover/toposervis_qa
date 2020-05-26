class CreateUsersCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :users_customers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
