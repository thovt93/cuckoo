class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many_attached :images

  IMAGE_SMALL = '50x50!'.freeze
end
