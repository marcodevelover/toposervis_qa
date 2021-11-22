class CreateRelatedUuids < ActiveRecord::Migration[6.0]
  def change
    create_table :related_uuids do |t|
      t.integer :sale_id
      t.string :uuid

      t.timestamps
    end
  end
end
