class Quotation < ApplicationRecord
  belongs_to :currency#, optional:true
  belongs_to :customer#, optional:true

  has_many :items, dependent: :destroy, as: :record
  has_many :product_variants, through: :items

  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  has_one :sale, as: :record
  accepts_nested_attributes_for :sale

  before_create :set_folio, :set_tax, :set_state
  before_update :set_sold, if: Proc.new { self.sale.present? && state == "active" }
  # active, sold
  before_validation :erase_sale, on: :delete, if: Proc.new { self.sale.present? }

  def erase_sale
    @sale = Sale.find_by(id: self.sale.id)
    @sale.update(deleted_at: Time.now)
  end

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

  def set_sold
    self.state = "sold"
  end  
end