class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many :variants, dependent: :destroy

  IMAGE_SMALL = '50x50!'.freeze
end
