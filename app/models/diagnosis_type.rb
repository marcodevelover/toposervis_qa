class DiagnosisType < ApplicationRecord
  has_many :diagnoses_types
  has_many :diagnoses, through: :diagnoses_types

  validates :name, presence: true
  validates :description, presence: true
end
