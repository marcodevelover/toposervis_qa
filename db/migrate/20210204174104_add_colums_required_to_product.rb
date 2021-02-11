class AddColumsRequiredToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :required_serial_number, :boolean
  end
end
