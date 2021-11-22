class ProductsDeliverable < ApplicationRecord
  belongs_to :product
  belongs_to :deliverable
end
