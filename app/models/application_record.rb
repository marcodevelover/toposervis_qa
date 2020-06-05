class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #require 'net/http'
  #include FacturapiRuby

  include ActiveStorageSupport::SupportForBase64
  #include AbstractController::Rendering

  before_validation :erase , on: :delete 
  #before_validation :erase_sale, on: :delete, if: Proc.new { self.sale.present? || self.diagnosis.sale.present? }
  before_validation :delivered , on: :output, if: Proc.new { self.diagnosis.present? && self.diagnosis.sale.present? && self.state == "sold" } 
  before_validation :invoice , on: :bill, if: Proc.new { self.sale.bill_state != "invoiced" }
  before_validation :cancel_invoice , on: :request_cancel_invoice, if: Proc.new { self.sale.bill_state == "invoiced" }
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

  def invoice
    @items = self.items
    begin
        ext_invoice = FacturapiRuby::Invoices.create(
                        customer:       {
                                            "legal_name": self.customer.business_name,
                                            "email": self.customer.customer_contacts.first.email,
                                            "tax_id": self.customer.rfc
                                        },
                        items:          (@items.map { |s| { quantity: s.quantity, 
                                                            product: { description: s.name, 
                                                                       product_key: s.product_variant.product_key, 
                                                                       price: s.unit_price, 
                                                                       tax_included: false} 
                                                          } 
                                                    }).as_json,
                        payment_form:   self.sale.payment_method.payment_method_key
                    )
        @sale = Sale.find_by(id: self.sale.id)
        @sale.update(bill_key: ext_invoice["id"], bill_state: "invoiced")

    rescue FacturapiRuby::FacturapiRubyError => e
        puts e.data['message']
        raise e.data['message']
    end    
  end  

  def cancel_invoice
    
    begin
        ext_invoice = FacturapiRuby::Invoices.cancel(self.sale.bill_key)
        @sale = Sale.find_by(id: self.sale.id)
        @sale.update(bill_state: ext_invoice["status"], cancellation_state: ext_invoice["cancellation_status"])

    rescue FacturapiRuby::FacturapiRubyError => e
        puts e.data['message']
        raise e.data['message']
    end   
  
  end    
end
