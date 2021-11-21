class Condition < ApplicationRecord

	validates :name, presence: true
  	validates :description, presence: true

	scope :condition_default, -> { where(default: true) }
end
