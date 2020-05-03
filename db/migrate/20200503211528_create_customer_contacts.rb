class CreateCustomerContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_contacts do |t|
      t.string :name
      t.string :department
      t.string :phone
      t.string :extension
      t.string :cellphone
      t.string :email
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
