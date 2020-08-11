class Item < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :product_variant

  before_create :set_tax, :set_cost_price

  def set_tax
    self.tax = Tax.where(default: true).first.value
  end  

  def set_cost_price
  	@stock_item = StockItem.find_by(product_variant_id: self.product_variant_id)
    self.cost_price = @stock_item.stock_movements.where("description != ? AND deleted_at is null", "Venta").last
  end

end
