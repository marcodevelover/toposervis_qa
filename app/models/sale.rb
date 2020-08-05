class Sale < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :payment_method
  belongs_to :payment_way
  belongs_to :use_of_cfdi

  before_create :set_folio, :remove_stock
  before_update :add_stock, if: Proc.new { deleted_at.present? }

  def set_folio
    @prefix = "V"
    Order.last ? @number = Order.last.id : @number = 1
    self.folio = "#{@prefix}#{@number.to_s.rjust(6, '0')}"
  end

  def remove_stock
    self.record.items.each do |item|
      @stock = StockItem.find_by(product_variant_id: item.product_variant_id)
      @stock.update(stock: @stock.stock - item.quantity)
    end
  end  

  def add_stock
    self.record.items.each do |item|
      @stock = StockItem.find_by(product_variant_id: item.product_variant_id)
      @stock.update(stock: @stock.stock + item.quantity)
    end
  end 
end
