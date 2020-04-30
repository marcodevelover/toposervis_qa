class Provider < ApplicationRecord
	has_many :provider_contacts
	has_one :provider_address, dependent: :destroy
	accepts_nested_attributes_for :provider_address, update_only: true
	accepts_nested_attributes_for :provider_contacts, reject_if: :all_blank, allow_destroy: true

	validates :name, presence: true
end
