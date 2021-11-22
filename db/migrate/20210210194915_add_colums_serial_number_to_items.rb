class AddColumsSerialNumberToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :serial_number, :string
  end
end
