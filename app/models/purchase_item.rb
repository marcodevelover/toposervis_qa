class PurchaseItem < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :product_variant
end
