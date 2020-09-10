class ServiceOrder < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :user, foreign_key: "created_by_id"
  has_many :orders_types
  has_many :type_service_orders, through: :orders_types
  has_many :order_accessories
  accepts_nested_attributes_for :order_accessories, reject_if: :all_blank, allow_destroy: true
  has_many_base64_attached :images
  accepts_nested_attributes_for :images_attachments, allow_destroy: true
  has_one :diagnosis, inverse_of: :service_order, touch: true
  accepts_nested_attributes_for :diagnosis, reject_if: :all_blank, allow_destroy: true

  before_create :set_folio, :set_state
  before_update :update_state, if: Proc.new { self.diagnosis.present? }
  #before_update :update_state_sale, if: Proc.new { self.diagnosis.sale.present? }
  
  # active, diagnosed, done, sold, delivered
  before_validation :erase_sale, on: :delete, if: Proc.new { self.diagnosis.sale.present? }
  before_validation :invoice , on: :bill_to_diagnosis, if: Proc.new { self.diagnosis.sale.bill_state != "invoiced" }
  before_validation :cancel_invoice , on: :request_cancel_invoice_to_diagnosis, if: Proc.new { self.diagnosis.sale.bill_state == "invoiced" }
  before_validation :cancellation_state_invoice , on: :request_cancellation_state_invoice_to_diagnosis, if: Proc.new { self.diagnosis.sale.bill_state == "valid" }

  validates :date_admission, presence: true
  
  def erase_sale
    @sale = Sale.find_by(id: self.diagnosis.sale.id)
    @sale.update(deleted_at: Time.now)
  end  

  def set_folio
  	@prefix = "M"
  	@date = Time.now
    ServiceOrder.last ? @number = ServiceOrder.last.id : @number = 1
    self.folio = "#{@prefix}#{@number.to_s.rjust(6, '0')}"
  end

  def set_state
    self.state = "active"
  end  

  def update_state
    @state = self.state
    @is_done = self.diagnosis.is_done
    case @state
    when "active"
      self.state = "diagnosed"
    when "done"
      self.state = "sold"
    else
      self.state
    end
  end

  def invoice
    
    @items = self.diagnosis.items

    begin
        ext_invoice = FacturapiRuby::Invoices.create(
                        customer:       {
                                            "legal_name": self.customer.business_name,
                                            "tax_id": self.customer.rfc
                                        },
                        items:          (@items.map { |s| { quantity: s.quantity, 
                                                            product: { description: s.name, 
                                                                       product_key: s.product_variant.product_key, 
                                                                       price: s.unit_price, 
                                                                       unit_key: s.product_variant.product.unit.unit_key,
                                                                       tax_included: false} 
                                                          } 
                                                    }).as_json,
                        payment_form:   self.diagnosis.sale.payment_method.payment_method_key,
                        payment_method: self.diagnosis.sale.payment_way.payment_way_key,
                        use: self.diagnosis.sale.use_of_cfdi.cfdi_key,
                        pdf_custom_section: "<strong>Número de serie</strong> #{self.serie.blank? ? '----' : self.serie}; <strong>Modelo</strong> #{self.model.blank? ? '----' : self.model}; <strong>Marca</strong> #{self.brand.blank? ? '----' : self.brand}"
                    )
        @sale = Sale.find_by(id: self.diagnosis.sale.id)
        @sale.update(bill_key: ext_invoice["id"], bill_state: "invoiced")

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
