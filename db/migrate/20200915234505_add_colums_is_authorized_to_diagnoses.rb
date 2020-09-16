class AddColumsIsAuthorizedToDiagnoses < ActiveRecord::Migration[6.0]
  def change
    add_column :diagnoses, :is_authorized, :boolean
  end
end
