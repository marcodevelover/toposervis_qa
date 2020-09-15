class AddColumsUserToServiceOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :service_orders, :user_id, :integer
  end
end
