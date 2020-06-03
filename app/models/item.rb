class Item < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :product_variant

  before_create :set_tax

  def set_tax
    self.tax = Tax.where(default: true).first.value
  end  

end
