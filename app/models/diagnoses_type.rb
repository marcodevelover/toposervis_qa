class DiagnosesType < ApplicationRecord
  belongs_to :diagnosis
  belongs_to :diagnosis_type
end
