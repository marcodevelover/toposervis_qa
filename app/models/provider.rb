class Provider < ApplicationRecord
	has_one :provider_address, dependent: :destroy
	accepts_nested_attributes_for :provider_address, update_only: true
end
