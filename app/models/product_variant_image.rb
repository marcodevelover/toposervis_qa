class ProductVariantImage < ApplicationRecord
  belongs_to :product_variant

  has_one_attached :image
  
end
