class PaymentBill < ApplicationRecord
	belongs_to :sale
  	belongs_to :payment_method
  	belongs_to :payment_way

  	before_validation :invoice , on: :payment_bill


  def invoice

    #@items = self.diagnosis.items

    begin
        ext_invoice = FacturapiRuby::Invoices.create(
        				type: "P",
                        customer:       {
                                            "legal_name": self.sale.record.customer.business_name,
                                            "email": self.sale.record.customer.customer_contacts.first.email,
                                            "tax_id": self.sale.record.customer.rfc
                                        },
                        payments:       [{
                                            "payment_form": self.payment_method.payment_method_key,
                                            related: [{ uuid: self.sale.uuid,
                                                       installment: self.partiality_number, 
                                                       last_balance: self.previous_balance_amount,
                                                       amount: self.amount_paid
                                                       }]
                                        }],
                        #pdf_custom_section: "<strong>Número de serie</strong> #{self.serie.blank? ? '----' : self.serie}; <strong>Modelo</strong> #{self.model.blank? ? '----' : self.model}; <strong>Marca</strong> #{self.brand.blank? ? '----' : self.brand}"
                    )
        #@sale = Sale.find_by(id: self.diagnosis.sale.id)
        #@sale.update(bill_key: ext_invoice["id"], bill_state: "invoiced")
        self.update(bill_key: ext_invoice["id"], bill_state: "invoiced", uuid: ext_invoice["uuid"], bill_folio: ext_invoice["folio_number"])

    rescue FacturapiRuby::FacturapiRubyError => e
        puts e.data['message']
        raise e.data['message']
    end    
  end

  def cancel_invoice
    
    begin
        ext_invoice = FacturapiRuby::Invoices.cancel(self.diagnosis.sale.bill_key)
        @sale = Sale.find_by(id: self.diagnosis.sale.id)
        @sale.update(bill_state: ext_invoice["status"], cancellation_state: ext_invoice["cancellation_status"])

    rescue FacturapiRuby::FacturapiRubyError => e
        puts e.data['message']
        raise e.data['message']
    end   
  
  end  

  def cancellation_state_invoice
 
    begin
        ext_invoice = FacturapiRuby::Invoices.get(self.diagnosis.sale.bill_key)
        @sale = Sale.find_by(id: self.diagnosis.sale.id)
        @sale.update(bill_state: ext_invoice["status"], cancellation_state: ext_invoice["cancellation_status"])

    rescue FacturapiRuby::FacturapiRubyError => e
        puts e.data['message']
        raise e.data['message']
    end     
    
  
  end  

end
