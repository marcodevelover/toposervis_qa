class Condition < ApplicationRecord

	validates :name, presence: true
  	validates :description, presence: true

	scope :condition_default, -> { where(default: true) }
	scope :service, -> { where(is_for: 'service') }
	scope :product, -> { where(is_for: 'product') }
	scope :both, -> { where(is_for: 'both') }
	scope :active, -> { where('deleted_at IS NULL')}
end
