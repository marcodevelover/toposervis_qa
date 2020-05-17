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


  before_create :set_folio, :set_state

  def set_folio
  	@prefix = "M"
  	@date = Time.now
    ServiceOrder.last ? @number = ServiceOrder.last.id+1 : @number = 1
    self.folio = "#{@prefix}#{@date.strftime("%C%m")}#{@number}"
  end

  def set_state
    self.state = "active"
  end  
end
