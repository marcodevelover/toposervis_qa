class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include ActiveStorageSupport::SupportForBase64

  before_validation :erase , on: :delete 
  #before_validation :erase_sale, on: :delete, if: Proc.new { self.sale.present? || self.diagnosis.sale.present? }
  before_validation :delivered , on: :output, if: Proc.new { self.diagnosis.present? && self.diagnosis.sale.present? && self.state == "sold" } 
  def erase	
  	self.deleted_at=Time.now
  end  

  #def erase_sale
  #  @sale = Sale.find_by(id: self.sale.id)
  #  @sale.update(deleted_at: Time.now)
  #end  

  def delivered	
    @service_order = ServiceOrder.find_by(id: self.id)
    @service_order.update(state: "delivered")    
  end  
end
