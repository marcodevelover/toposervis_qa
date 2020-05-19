class CreateDiagnoses < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnoses do |t|
      t.references :service_order, null: false, foreign_key: true
      t.datetime :date
      t.string :delivery_time
      t.datetime :date_delivery
      t.references :diagnosis_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
