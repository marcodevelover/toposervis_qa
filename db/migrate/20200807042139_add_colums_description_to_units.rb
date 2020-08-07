class AddColumsDescriptionToUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :unit_description, :string
  end
end
