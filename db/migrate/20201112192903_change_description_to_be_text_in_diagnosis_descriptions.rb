class ChangeDescriptionToBeTextInDiagnosisDescriptions < ActiveRecord::Migration[6.0]
  def change
  	change_column :diagnosis_descriptions, :description, :text
  end
end
