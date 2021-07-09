class ChangeQuantityToBeDecimalInItems < ActiveRecord::Migration[6.0]
  def change
  	change_column :items, :quantity, :decimal, precision: 18, scale: 4
  end
end
