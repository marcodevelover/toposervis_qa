class Customer < ApplicationRecord
	has_one :customer_address, dependent: :destroy
	accepts_nested_attributes_for :customer_address, update_only: true
	
	has_many :customer_contacts
	accepts_nested_attributes_for :customer_contacts, reject_if: :all_blank, allow_destroy: true


	has_one :customer_bank, dependent: :destroy
	accepts_nested_attributes_for :customer_bank, update_only: true

	validates :name, presence: true
end