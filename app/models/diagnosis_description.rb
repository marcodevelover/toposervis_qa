class DiagnosisDescription < ApplicationRecord
	belongs_to :diagnosis
	belongs_to :user, foreign_key: "created_by_id"
end
