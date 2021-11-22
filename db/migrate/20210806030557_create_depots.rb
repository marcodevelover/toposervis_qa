class CreateDepots < ActiveRecord::Migration[6.0]
  def change
    create_table :depots do |t|
      t.string :name
      t.string :description
      t.boolean :default
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
