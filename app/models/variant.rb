class Variant < ApplicationRecord
  belongs_to :product
  has_one_attached :image
  has_many :option_values_variants, dependent: :destroy
  has_many :option_values, through: :option_values_variants
end
