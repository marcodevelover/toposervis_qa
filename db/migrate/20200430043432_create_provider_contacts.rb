class CreateProviderContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :provider_contacts do |t|
      t.string :name
      t.string :department
      t.string :phone
      t.string :extension
      t.string :cellphone
      t.string :email
      t.references :provider, null: false, foreign_key: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
