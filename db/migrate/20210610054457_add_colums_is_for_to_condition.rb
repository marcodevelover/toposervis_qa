class AddColumsIsForToCondition < ActiveRecord::Migration[6.0]
  def change
    add_column :conditions, :is_for, :string
  end
end
