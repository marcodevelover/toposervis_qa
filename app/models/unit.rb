class Unit < ApplicationRecord
	validates :name, presence: true
	validates :unit_key, presence: true
	validates :unit_description, presence: true
end
