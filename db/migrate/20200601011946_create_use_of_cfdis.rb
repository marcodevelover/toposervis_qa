class CreateUseOfCfdis < ActiveRecord::Migration[6.0]
  def change
    create_table :use_of_cfdis do |t|
      t.string :cfdi_key
      t.string :description
      t.boolean :persona_fisica
      t.boolean :persona_moral

      t.timestamps
    end
  end
end
