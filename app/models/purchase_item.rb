class PurchaseItem < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :product_variant
  has_one_base64_attached :image
  
end