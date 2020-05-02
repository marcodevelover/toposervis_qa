class ProductVariantImage < ApplicationRecord
  belongs_to :product_variant

  #has_one_attached :image
  has_one_base64_attached :image
end
