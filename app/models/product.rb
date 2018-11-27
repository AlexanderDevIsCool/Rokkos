class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximun: 50},
            uniqueness: { case_sensitive: false }
  validates :description, length: {mininmum: 10, maximum: 400 }
  validates :sale_price, length: {minimum: 1, maximum: 7}

  has_many :desires
  has_many :physicians, :through => :desires
  mount_uploader :image, ImageUploader

  validates :image, file_size: { less_than: 10.megabytes}
  validates :quantity, presence: true
end
