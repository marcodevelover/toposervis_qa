class Expense < ApplicationRecord
  belongs_to :payment_method
  belongs_to :account
  belongs_to :category_type
  belongs_to :category
  belongs_to :provider
  belongs_to :document_type

  has_one :expense_amount, dependent: :destroy
  accepts_nested_attributes_for :expense_amount, update_only: true

  has_many_base64_attached :files
  accepts_nested_attributes_for :files_attachments, allow_destroy: true
end
