class AddColumsBillFolioToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :bill_folio, :string
  end
end
