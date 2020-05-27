class Purchase < ApplicationRecord
  belongs_to :currency
  belongs_to :receipt_type
  belongs_to :entry_code
  belongs_to :provider
  has_many :purchase_items, dependent: :destroy, as: :record
  has_many :product_variants, through: :purchase_items

  accepts_nested_attributes_for :purchase_items, reject_if: :all_blank, allow_destroy: true

  before_create :set_tax, :set_state, :set_exchange_rate, :update_stock
  before_update :update_stock

  def set_exchange_rate
    self.exchange_rate = 1.0 #need info#
  end    

  def set_tax
    self.tax = Tax.where(default: true).first.value
  end  

  def set_state
    self.state = "active"
  end  

  def update_stock
    self.purchase_items.each do |item|
      @stock = StockItem.find_by(product_variant_id: item.product_variant_id)
      @stock.update(stock: @stock.stock + item.quantity)
    end
  end  
end
