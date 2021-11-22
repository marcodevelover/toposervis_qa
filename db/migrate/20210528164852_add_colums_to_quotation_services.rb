class AddColumsToQuotationServices < ActiveRecord::Migration[6.0]
  def change
    add_column :quotation_services, :is_tax, :boolean
  end
end
