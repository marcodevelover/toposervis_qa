class Quotation < ApplicationRecord
  belongs_to :currency
  belongs_to :customer

  has_many :items, dependent: :destroy, as: :record
  has_many :product_variants, through: :items

  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
end
