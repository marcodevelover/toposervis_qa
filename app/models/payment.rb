class Payment < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :payment_method
  belongs_to :payment_way
end
