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
  
  # active, diagnosed, sold, delivered
  before_validation :erase_sale, on: :delete, if: Proc.new { self.diagnosis.sale.present? }

  def erase_sale
    @sale = Sale.find_by(id: self.diagnosis.sale.id)
    @sale.update(deleted_at: Time.now)
  end  

  def set_folio
  	@prefix = "M"
  	@date = Time.now
    ServiceOrder.last ? @number = ServiceOrder.last.id+1 : @number = 1
    self.folio = "#{@prefix}#{@date.strftime("%C%m")}#{@number}"
  end

  def set_state
    self.state = "active"
  end  

  def update_state
    #self.state = "diagnosed"
    @state = self.state
    case @state
    when "active"
      self.state = "diagnosed"
    when "diagnosed"
      self.state = "sold"
    else
      self.state
    end    
  end    

end
