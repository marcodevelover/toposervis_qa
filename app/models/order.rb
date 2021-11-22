class Order < ApplicationRecord
  belongs_to :currency
  belongs_to :customer
  belongs_to :user, foreign_key: "created_by_id"
  has_many :items, dependent: :destroy, as: :record
  has_many :product_variants, through: :items
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
  has_one :sale, as: :record
  accepts_nested_attributes_for :sale

  has_many :payments, as: :record
  accepts_nested_attributes_for :payments

  before_create :set_tax, :set_state
  before_validation :erase_sale, on: :delete, if: Proc.new { self.sale.present? }

  validates :date, presence: true
  validates :currency, presence: true
  validates :exchange_rate, presence: true
  validates :customer, presence: true

  scope :active, -> { where('deleted_at IS NULL')}
  
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