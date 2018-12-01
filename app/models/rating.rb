class Rating < ApplicationRecord
  belongs_to :product

  validates :value, presence: true
end
