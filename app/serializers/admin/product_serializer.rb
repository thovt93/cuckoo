class Admin::ProductSerializer < Admin::ApplicationSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description
  has_many :variants
end
