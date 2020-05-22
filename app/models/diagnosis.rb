class Diagnosis < ApplicationRecord
  belongs_to :service_order, inverse_of: :diagnosis
  belongs_to :diagnosis_type

  has_many :diagnosis_descriptions, inverse_of: :diagnosis
  accepts_nested_attributes_for :diagnosis_descriptions, reject_if: :all_blank, allow_destroy: true

  has_many_base64_attached :images
  accepts_nested_attributes_for :images_attachments, allow_destroy: true

  has_many :items, dependent: :destroy, as: :record
  has_many :product_variants, through: :items
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  before_create :set_tax

  def set_tax
    self.tax = Tax.where(default: true).first.value
  end  

end