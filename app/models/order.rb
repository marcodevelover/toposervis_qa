class Order < ApplicationRecord
  belongs_to :currency
  belongs_to :customer

  has_many :items, dependent: :destroy, as: :record
  has_many :product_variants, through: :items

  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  has_one :sale, as: :record
  accepts_nested_attributes_for :sale

  before_create :set_tax, :set_state

  def set_folio
    @prefix = "V"
    @date = Time.now
    Order.last ? @number = Order.last.id+1 : @number = 1
    self.folio = "#{@prefix}#{@date.strftime("%C%m")}#{@number}"
  end

  def set_tax
    self.tax = Tax.where(default: true).first.value
  end  

  def set_state
    self.state = "active"
  end
end