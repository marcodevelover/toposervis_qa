class AddColumsToUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :units, :unit_key, :string
  end
end
