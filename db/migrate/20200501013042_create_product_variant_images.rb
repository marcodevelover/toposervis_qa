class CreateProductVariantImages < ActiveRecord::Migration[6.0]
  def change
    create_table :product_variant_images do |t|
      t.references :product_variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
