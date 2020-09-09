class TypeServiceOrder < ApplicationRecord
  has_many :orders_types
  has_many :service_orders, through: :orders_types	

  validates :name, presence: true
  validates :description, presence: true
end
