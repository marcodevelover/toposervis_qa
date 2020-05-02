class Accessory < ApplicationRecord
  has_many :products_accessories
  has_many :products, through: :products_accessories
end
