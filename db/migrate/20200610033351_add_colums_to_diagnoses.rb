class AddColumsToDiagnoses < ActiveRecord::Migration[6.0]
  def change
    add_column :diagnoses, :is_tax, :boolean
  end
end
