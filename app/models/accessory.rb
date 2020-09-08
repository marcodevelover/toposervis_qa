class Accessory < ApplicationRecord
  has_many :products_accessories, dependent: :destroy
  has_many :products, through: :products_accessories

  validates :name, presence: true
end
