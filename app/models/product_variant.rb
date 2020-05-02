class ProductVariant < ApplicationRecord
  belongs_to :product
  belongs_to :currency

  has_many :product_variant_images

  accepts_nested_attributes_for :product_variant_images, reject_if: :all_blank, allow_destroy: true
end
