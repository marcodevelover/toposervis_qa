class AddColumsToQuotations < ActiveRecord::Migration[6.0]
  def change
    add_column :quotations, :is_tax, :boolean
  end
end
