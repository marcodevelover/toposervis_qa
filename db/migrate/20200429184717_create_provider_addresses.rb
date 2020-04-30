class CreateProviderAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :provider_addresses do |t|
      t.string :street
      t.string :number
      t.string :crossing
      t.string :postcode
      t.string :colony
      t.string :town
      t.string :state
      t.string :country
      t.references :provider, null: false, foreign_key: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
