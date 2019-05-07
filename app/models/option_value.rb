class OptionValue < ApplicationRecord
  belongs_to :option_type
  has_many :option_values_variants
  has_many :variants, through: :option_values_variants, dependent: :destroy
end
