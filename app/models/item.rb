class Item < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :product_variant

  before_create :set_tax, :set_cost_price, :default_values

  def default_values
    self.serial_number.blank? ? self.serial_number = 'N/A' : self.serial_number
  end

  def set_tax
    self.tax = Tax.where(default: true).first.value
  end  

  def set_cost_price
  	@stock_item = StockItem.find_by(product_variant_id: self.product_variant_id)
    self.cost_price = @stock_item.stock_movements.where("description != ? AND deleted_at is null", "Venta").last
  end

end
