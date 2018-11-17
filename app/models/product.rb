class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximun: 50},
            uniqueness: { case_sensitive: false }
  validates :description, length: {mininmum: 10, maximum: 255 }
  validates :sale_price, length: {minimum: 1, maximum: 7}

  mount_uploader :image, ImageUploader

  validates :image, file_size: { less_than: 10.megabytes}
end
