class Category < ApplicationRecord
  belongs_to :category_type
  validates :name, presence: true
  validates :description, presence: true
end
