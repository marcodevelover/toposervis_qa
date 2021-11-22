class CreateDiagnosesTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnoses_types do |t|
      t.references :diagnosis, null: false, foreign_key: true
      t.references :diagnosis_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
