class Quotation < ApplicationRecord
  belongs_to :currency#, optional:true
  belongs_to :customer#, optional:true

  has_many :items, dependent: :destroy, as: :record
  has_many :product_variants, through: :items

  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  before_create :set_folio, :set_tax, :set_state

  def set_folio
    @prefix = "C"
    @date = Time.now
    Quotation.last ? @number = Quotation.last.id+1 : @number = 1
    self.folio = "#{@prefix}#{@date.strftime("%C%m")}#{@number}"
  end

  def set_tax
    self.tax = Tax.where(default: true).first.value
  end  

  def set_state
    self.state = "active"
  end
end