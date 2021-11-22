class CreateActivityDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_descriptions do |t|
      t.references :diagnosis, null: false, foreign_key: true
      t.string :description
      t.integer :created_by_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
