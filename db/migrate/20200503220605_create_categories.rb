class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.references :category_type, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
