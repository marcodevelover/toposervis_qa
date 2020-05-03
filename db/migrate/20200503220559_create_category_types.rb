class CreateCategoryTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :category_types do |t|
      t.string :name
      t.string :description
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
