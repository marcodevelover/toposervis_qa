class Sale < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :payment_method
  belongs_to :payment_way

  before_create :set_folio, :remove_stock
  before_update :add_stock, if: Proc.new { deleted_at.present? }

  def set_folio
    @prefix = "V"
    @date = Time.now
    Sale.last ? @number = Sale.last.id+1 : @number = 1
    self.folio = "#{@prefix}#{@date.strftime("%C%m")}#{@number}"
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
