class StockItem < ApplicationRecord
  belongs_to :product_variant
  has_many :stock_movements
end
