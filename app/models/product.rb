class Product < ApplicationRecord
  belongs_to :product_line
  belongs_to :unit
  belongs_to :provider
  has_many :product_variants
  accepts_nested_attributes_for :product_variants, reject_if: :all_blank, allow_destroy: true
  has_many :products_accessories, inverse_of: :product, dependent: :destroy
  has_many :accessories, through: :products_accessories
  accepts_nested_attributes_for :products_accessories, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
end
