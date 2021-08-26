class Project < ApplicationRecord
  belongs_to :currency
  belongs_to :receipt_type, optional: true
  belongs_to :entry_code, optional: true
  belongs_to :provider, optional: true
  has_many :project_items, dependent: :destroy, as: :record
  has_many :product_variants, through: :project_items
  belongs_to :user, foreign_key: "created_by_id"
  belongs_to :payment_way, optional: true

  validates :date, presence: true
  

  accepts_nested_attributes_for :project_items, reject_if: :all_blank, allow_destroy: true

  before_create :set_folio, :set_tax, :set_state, :remove_stock
  
  before_update :add_stock, if: Proc.new { deleted_at.present? }

  scope :active, -> { where('deleted_at IS NULL')}
  
  def set_folio
    @prefix = "PR"
    @date = Time.now
    Project.last ? @number = Project.last.id : @number = 1
    self.folio = "#{@prefix}#{@number.to_s.rjust(6, '0')}"
  end

  def set_tax
    self.tax = Tax.where(default: true).first.value
  end  

  def set_state
    self.state = "active"
  end  

  def remove_stock
    self.project_items.each do |item|
      @stock = StockItem.find_by(product_variant_id: item.product_variant_id)
      @stock.update(stock: @stock.stock - item.quantity)
      @stock.stock_movements.create(stock_item_id: @stock, folio: self.folio, description: 'Registro de gastos', stock: @stock.stock, quantity: -item.quantity, total: item.total, currency_id: self.currency_id, cost_price: item.unit_price)
      if item.number_serie != 'N/A' && !item.number_serie.blank?
        @product_stock = ProductStock.find_by(product_variant_id: item.product_variant_id, number_serie: item.number_serie)
        @product_stock.update(status: "assigned")
      end
    end
  end  

  def add_stock
    self.project_items.each do |item|
      @stock = StockItem.find_by(product_variant_id: item.product_variant_id)
      @stock.update(stock: @stock.stock + item.quantity)
      @stock.stock_movements.create(stock_item_id: @stock, folio: self.folio, description: 'Registro de gastos', stock: @stock.stock, quantity: item.quantity, total: item.total, currency_id: self.currency_id, cost_price: item.unit_price, deleted_at: DateTime.now )
      if item.number_serie != 'N/A' && !item.number_serie.blank?
        @product_stock = ProductStock.find_by(number_serie: item.number_serie)
        @product_stock.update(status: nil)
      end
    end
  end 

end
