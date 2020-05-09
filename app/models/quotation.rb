class Quotation < ApplicationRecord
  belongs_to :currency, optional:true
  belongs_to :customer, optional:true

  has_many :items, dependent: :destroy, as: :record
  has_many :product_variants, through: :items

  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  before_create :set_folio

  def set_folio
  	@prefix = "C"
  	@date = Time.now
    self.folio = "#{@prefix}#{@date.strftime("%C%m")}#{Quotation.last.id+1}"
  end
end
