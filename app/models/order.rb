class Order < ApplicationRecord
  belongs_to :currency
  belongs_to :customer

  has_many :items, dependent: :destroy, as: :record
  has_many :product_variants, through: :items

  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  has_one :sale, as: :record
  accepts_nested_attributes_for :sale

  before_create :set_tax, :set_state
  before_validation :erase_sale, on: :delete, if: Proc.new { self.sale.present? }

  def erase_sale
    @sale = Sale.find_by(id: self.sale.id)
    @sale.update(deleted_at: Time.now)
  end    

  def set_folio
    @prefix = "V"
    Order.last ? @number = Order.last.id : @number = 1
    self.folio = "#{@prefix}#{@number.to_s.rjust(6, '0')}"
  end

  def set_tax
    self.tax = Tax.where(default: true).first.value
  end  

  def set_state
    self.state = "active"
  end
  

end