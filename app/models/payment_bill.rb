class PaymentBill < ApplicationRecord
	belongs_to :sale
  	belongs_to :payment_method
  	belongs_to :payment_way
end
