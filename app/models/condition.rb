class Condition < ApplicationRecord

	scope :condition_default, -> { where(default: true) }
end
