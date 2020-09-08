class Currency < ApplicationRecord
	validates :name, presence: true
	validates :exchange_rate, presence: true
end
