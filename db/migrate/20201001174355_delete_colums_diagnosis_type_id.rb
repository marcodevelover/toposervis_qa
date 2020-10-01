class DeleteColumsDiagnosisTypeId < ActiveRecord::Migration[6.0]
  def change
  	remove_column :diagnoses, :diagnosis_type_id
  end
end
