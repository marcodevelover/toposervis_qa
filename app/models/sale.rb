class Sale < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :payment_method
  belongs_to :payment_way

  before_create :set_folio

  def set_folio
    @prefix = "V"
    @date = Time.now
    Sale.last ? @number = Sale.last.id+1 : @number = 1
    self.folio = "#{@prefix}#{@date.strftime("%C%m")}#{@number}"
  end  
end
