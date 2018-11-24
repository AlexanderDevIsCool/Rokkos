class ProductTagsJoin < ApplicationRecord
  has_many :products
  has_many :tags
end
