class Provider < ApplicationRecord
	has_one :provider_address, dependent: :destroy
	accepts_nested_attributes_for :provider_address, update_only: true
	
	has_many :provider_contacts
	accepts_nested_attributes_for :provider_contacts, reject_if: :all_blank, allow_destroy: true


	has_one :provider_bank, dependent: :destroy
	accepts_nested_attributes_for :provider_bank, update_only: true

	validates :name, presence: true
end
