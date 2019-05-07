class Admin::OptionTypeSerializer < Admin::ApplicationSerializer
  attributes :id, :name, :presentation
  has_many :option_values
end
