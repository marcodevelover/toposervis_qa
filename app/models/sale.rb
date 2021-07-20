class Sale < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :payment_method
  belongs_to :payment_way
  belongs_to :use_of_cfdi
  has_many :payment_bills
  before_create :set_folio, :remove_stock, :set_is_due
  before_update :add_stock, if: Proc.new { deleted_at.present? }

  def set_folio
    @prefix = "V"
    Sale.last ? @number = Sale.last.id + 1 : @number = 1
    self.folio = "#{@prefix}#{@number.to_s.rjust(6, '0')}"
  end

  def set_is_due
    if self.payment_way.payment_way_key == "PUE"
      self.is_due = false
    else
      self.is_due = true
    end
  end   

  def remove_stock
    self.record.items.each do |item|
      @stock = StockItem.find_by(product_variant_id: item.product_variant_id)
      @stock.update(stock: @stock.stock - item.quantity)
      @stock.stock_movements.create(stock_item_id: @stock, folio: self.folio, description: 'Venta', stock: @stock.stock, quantity: -item.quantity, total: item.total, currency_id: self.record.currency_id, cost_price: item.unit_price)
      if item.serial_number != 'N/A' && !item.serial_number.blank?
        @product_stock = ProductStock.find_by(product_variant_id: item.product_variant_id, serial_number: item.serial_number)
        @product_stock.update(status: "sold")
      end
    end
  end  

  def add_stock
    self.record.items.each do |item|
      @stock = StockItem.find_by(product_variant_id: item.product_variant_id)
      @stock.update(stock: @stock.stock + item.quantity)
      @stock.stock_movements.create(stock_item_id: @stock, folio: self.folio, description: 'Venta', stock: @stock.stock, quantity: item.quantity, total: item.total, currency_id: self.record.currency_id, cost_price: item.unit_price, deleted_at: DateTime.now )
      if item.serial_number != 'N/A' && !item.serial_number.blank?
        @product_stock = ProductStock.find_by(serial_number: item.serial_number)
        @product_stock.update(status: nil)
      end
    end
  end 
end
