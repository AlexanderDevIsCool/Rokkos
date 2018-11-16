class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximun: 50},
            uniqueness: { case_sensitive: false }
  validates :description, length: {mininmum: 10, maximum: 255 }
  validates :sale_price, length: {minimum: 1, maximum: 7}
end
