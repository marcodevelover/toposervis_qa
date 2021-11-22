class Deliverable < ApplicationRecord
  has_many :products_deliverables
  has_many :products, through: :products_deliverables

  validates :name, presence: true
end
