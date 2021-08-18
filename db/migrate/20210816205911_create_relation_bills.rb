class CreateRelationBills < ActiveRecord::Migration[6.0]
  def change
    create_table :relation_bills do |t|
      t.string :name
      t.string :description
      t.string :relation_key

      t.timestamps
    end
  end
end
