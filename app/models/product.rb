class Product < ApplicationRecord
  belongs_to :product_line
  belongs_to :unit
  belongs_to :provider

  has_many :product_variants
  accepts_nested_attributes_for :product_variants, reject_if: :all_blank, allow_destroy: true

  has_many :products_accessories
  has_many :accesories, through: :products_accessories
end
