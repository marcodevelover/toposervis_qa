class Diagnosis < ApplicationRecord
  belongs_to :currency
  belongs_to :service_order, inverse_of: :diagnosis
  belongs_to :diagnosis_type

  has_many :diagnosis_descriptions, inverse_of: :diagnosis
  accepts_nested_attributes_for :diagnosis_descriptions, reject_if: :all_blank, allow_destroy: true

  has_many_base64_attached :images
  accepts_nested_attributes_for :images_attachments, allow_destroy: true

  has_many :items, dependent: :destroy, as: :record
  has_many :product_variants, through: :items
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  has_one :sale, as: :record
  accepts_nested_attributes_for :sale

  before_create :set_tax
  before_update :update_state_for_sale, if: Proc.new { self.sale.present? && self.is_done}

  def set_tax
    self.tax = Tax.where(default: true).first.value
  end  

  def update_state_for_sale
    @service_order = ServiceOrder.find_by(id: self.service_order.id)
    @service_order.update(state: 'done')
  end    

end
