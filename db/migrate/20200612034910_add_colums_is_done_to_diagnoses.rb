class AddColumsIsDoneToDiagnoses < ActiveRecord::Migration[6.0]
  def change
    add_column :diagnoses, :is_done, :boolean
  end
end
