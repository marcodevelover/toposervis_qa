class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.string :name
      t.text :description
      t.boolean :default
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
